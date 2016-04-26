using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project
{
    public partial class SignUp : System.Web.UI.Page
    {
        private SMSService textMessage;
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    SmtpClient mailClient = new SmtpClient();
                    try
                    {
                        string first = txtfirst.Text;
                        string last = txtlast.Text;
                        string carrier = DropDownList1.SelectedValue;
                        string phone = txtphone.Text;
                        string email = txtemail.Text;
                        string user = txtuser.Text;
                        string password = txtpassword.Text;
                        string confirm = txtconfirm.Text;
                        string gradDate = DropDownList2.SelectedValue + ' ' + txtyear.Text;
                        bool isEventSubs = CheckBox1.Checked;

                        //Session["username"] = user;

                        SqlConnection conn = new SqlConnection(ISAconnectionString);

                        // check email exists
                       int flag = checkemail(email, user);
                        //int user = checkUser(user);


                        conn.Open();
                        if (flag == 0)

                        {
                            string query1 = "INSERT INTO users (firstName,lastName,carrier,phone,email,userId,pass,gradDate,isEventSubs,roles)VALUES('" + first + "', ' " + last + " ', '" + carrier + "', '" + phone + "', '" + email + "', '" + user + "', '" + password + "', '" + gradDate + "','" + isEventSubs + "', 'PU')";
                            SqlCommand cmd = new SqlCommand(query1, conn);

                            int rowAffected = cmd.ExecuteNonQuery();
                            if (rowAffected == 1)
                            {
                                if (phone != "")
                                {
                                    string message = "Thank you for siging up with us";
                                    textMessage = new SMSService(carrier, phone, message);
                                    textMessage.SendTextMessage(textMessage);
                                    Response.Redirect("Home.aspx");
                                }
                                else
                                    Response.Redirect("Home.aspx");
                            }
                            else
                                error.Text = "Invalid Entry";

                        }// end of outer if

                        else
                            emailexist.Text = "Email already exists. Please use another Email ...!!!";

                        conn.Close();
                    }

                    catch (SqlException ex)
                    {
                        switch (ex.Number)
                        {
                            case 2627:
                                string display = "User ID already used!!";
                                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('" + display + "');", true);
                                break;
                            default:
                                throw;
                        }
                    }  // end of catch
                } // End of if Page isValid()
            }
        }


        // check email
        protected int checkemail (string useremail, string userid)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            conn.Open();
            string query1 = "select userId,email from users";
            SqlCommand cmd = new SqlCommand(query1, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            int count = 0;

            while(dr.Read())
            {
                if(dr["email"].ToString() == useremail || dr["userId"].ToString() == userid)
                {
                    count++;
                    break;
                }
            }

            conn.Close();
            return count;
        }

  

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtphone.Enabled = true;
        }
    }
}