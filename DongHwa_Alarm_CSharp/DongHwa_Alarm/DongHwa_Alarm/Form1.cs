using Google.Apis.Auth.OAuth2;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Data.SqlClient;
using System.Reflection.Emit;

namespace DongHwa_Alarm
{
    public partial class Form1 : Form
    {
        private const string ProjectId = "donghwa-55b24"; // Firebase 프로젝트 ID
        private const string JsonPath = "donghwa-55b24-firebase-adminsdk-27ovr-05ed196676.json"; // 서비스 계정 키 경로
        public Form1()
        {
            InitializeComponent();
        }

        private async void button1_Click(object sender, EventArgs e)
        {
            // ListBox의 모든 항목을 가져와서 문자열로 결합
            var allItems = string.Join(Environment.NewLine, listBox1.Items.Cast<string>());
            // 클립보드에 복사
            Clipboard.SetText(allItems);

            /*
            string deviceToken = "fWYAXT0XQPSNagg0c4KRjW:APA91bEzb4cDKLu7fMIQ0YvFdXk_6oM3zre5U4OD6HRJORA9Y9jMRGsQ0tiVPe3JyYoDphRzVDPtBXx34puHufxgf5m1wakUwgh0YWdopQWDRa0MLdql7wwAH6FtTkQs0bamvrwnLz52";// txtDeviceToken.Text;
            string title = "title";// txtTitle.Text;
            string body = "body";// txtBody.Text;

            if (string.IsNullOrEmpty(deviceToken) || string.IsNullOrEmpty(title) || string.IsNullOrEmpty(body))
            {
                listBox1.Items.Add("모든 필드를 입력하세요.");
                return;
            }

            var result = await SendPushNotification(deviceToken, title, body);
            listBox1.Items.Add(result ? "메시지가 성공적으로 전송되었습니다." : "메시지 전송 실패.");
            */
        }

        private async Task<bool> SendPushNotification(string deviceToken, string title, string body)
        {
            try
            {
                var credential = GoogleCredential.FromFile(JsonPath)
                    .CreateScoped("https://www.googleapis.com/auth/firebase.messaging");

                var token = await credential.UnderlyingCredential.GetAccessTokenForRequestAsync();

                var message = new
                {
                    message = new
                    {
                        token = deviceToken,
                        notification = new
                        {
                            title = title,
                            body = body
                        }
                    }
                };

                using (var httpClient = new HttpClient())
                {
                    httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                    string url = $"https://fcm.googleapis.com/v1/projects/donghwa-55b24/messages:send";
                    var json = JsonConvert.SerializeObject(message);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");

                    var response = await httpClient.PostAsync(url, content);
                    return response.IsSuccessStatusCode;
                }
            }
            catch (Exception ex)
            {
                listBox1.Items.Add($"오류 발생: {ex.Message}");
                return false;
            }
        }

        private async void timer1_Tick(object sender, EventArgs e)
        {
            timer1.Enabled = false;
            string connectionString = "Server=211.205.9.2,18068;Database=DONGHWA;User Id=DONGHWA;Password=donghwacocos^^";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("", connection);
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = "select top(1) * from PushData order by PushNo";
                try
                {
                   // connection.Open();
                    await connection.OpenAsync();// ui 멈춤없이 실행 // 김동휘 수정
                    SqlDataReader reader = command.ExecuteReader();

                    if ( reader.HasRows) // PushData 조회결과 있으면 실행
                    {
                        reader.Read();
                        string pushno = reader["PushNo"].ToString();
                        string deviceToken = reader["Token"].ToString();
                        string title = reader["Title"].ToString();
                        string body = reader["Msg"].ToString();
                        reader.Close();

                        if (string.IsNullOrEmpty(deviceToken) || string.IsNullOrEmpty(title) || string.IsNullOrEmpty(body))
                        {
                            // 250307 김동휘 수정
                            using (SqlCommand deleteCommand = new SqlCommand("DELETE FROM PushData", connection))
                            {
                                //connection.Close();
                                //connection.Open();
                                int deletedRows = deleteCommand.ExecuteNonQuery();
                                listBox1.Items.Add("잘못된 데이터를 인식하여 PushData 테이블에서 데이터가 삭제되었습니다.");
                            }
                            //   listBox1.Items.Add("모든 필드를 입력하세요.");
                            timer1.Enabled = true;
                            return;
                        }

                        listBox1.Items.Add(title + ' ' + body + ' ' + deviceToken);

                        var result = await SendPushNotification(deviceToken, title, body);
                        string currentDateTime = "["+DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")+"]";
                        listBox1.Items.Add(result ? currentDateTime+"메시지가 성공적으로 전송되었습니다." : currentDateTime+"메시지 전송 실패.");
                        string resultCommand;
                        if (result)
                        {
                            resultCommand = "1";
                        }
                        else
                        {
                            resultCommand = "0";
                        }
                        //connection.Close();
                        //connection.Open();
                        SqlCommand command2 = new SqlCommand("", connection);
                        command2.CommandType = System.Data.CommandType.Text;
                        command2.CommandText = "Insert Into PushData_Log(PushNo, Token, Title, Msg, InsertTime, LogTime, SendResult) "
                                              + " select top(1) *, GETDATE() as LogTime, "+ resultCommand + " as SendResult from PushData Where PushNo = " + pushno
                                              + " Delete from PushData Where PushNo = " + pushno;
                        //listBox1.Items.Add(command2.CommandText);
                        int rowsAffected = command2.ExecuteNonQuery(); // 실행 결과로 영향을 받은 행 수 반환
                        //listBox1.Items.Add($"{rowsAffected} 개 처리됨");
                        listBox1.TopIndex = listBox1.Items.Count - 1;
                        
                    }
                }
                catch (Exception ex)
                {
                    listBox1.Items.Add(ex.Message);
                }
                //listBox1.TopIndex = listBox1.Items.Count - 1;
                label1.Text = listBox1.Items.Count.ToString();
            }
            timer1.Enabled = true;        
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            if (listBox1.Items.Count > 500)
                listBox1.Items.Clear(); //카운트 500 넘어가면 초기화 김동휘 추가

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
    }
}
