using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project
{
    public partial class Main : System.Web.UI.MasterPage
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";


        protected void Page_Load(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(Request.Path);
            MultiView2.ActiveViewIndex = 0;
            if (Request.QueryString["logout"] == "true")
            {
                Session["user_id"] = null;
                Session["curr_role"] = null;
            }

            if(Session["user_id"] == null && filename == "PostComment.aspx")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "script", "getLoginModal();", true);
                MultiView2.ActiveViewIndex = 0;
                MultiView1.ActiveViewIndex = 0;
            }
            else if (Session["user_id"]==null  && filename != "Home.aspx" && filename != "documents.aspx" && filename != "members.aspx" && filename != "ForgotPassword.aspx" && filename!= "About.aspx" && filename != "EventCommon.aspx" && filename != "SignUp.aspx" && filename !="Alumini.aspx")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "script", "getLoginModal();", true);
                MultiView2.ActiveViewIndex = 0;               
                Response.Redirect("Home.aspx");
            }

            else
            {

                MultiView1.ActiveViewIndex = 0;
                if (Session["user_id"] != null)
                {

                    SqlConnection conn = new SqlConnection(ISAconnectionString);
                    try
                    {
                        conn.Open();
                        String query = "SELECT roles FROM USERS where userId = @userID";
                        SqlCommand cmd = new SqlCommand(query, conn);
                        cmd.Parameters.AddWithValue("@userID", Session["user_id"].ToString());
                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.Read())
                        {
                            if (dr["roles"].ToString() == "PU")
                            {
                                username.InnerText = Session["user_id"].ToString();
                                Session["curr_role"] = "PU";
                                MultiView1.ActiveViewIndex = 1;
                                MultiView2.ActiveViewIndex = 0;
                            }

                            else if (dr["roles"].ToString() == "Admin")
                            {
                                admin_name.InnerText = Session["user_id"].ToString();
                                Session["curr_role"] = "Admin";
                                MultiView1.ActiveViewIndex = 2;
                                MultiView2.ActiveViewIndex = 1;
                            }
                            //committee_name
                            else if(dr["roles"].ToString() == "CM")
                            {
                                committee_name.InnerText = Session["user_id"].ToString();
                                Session["curr_role"] = "CM";
                                MultiView1.ActiveViewIndex = 3;
                                MultiView2.ActiveViewIndex = 2;
                            }

                        }

                    }
                    catch (SqlException exception)
                    {
                        Response.Write("<p>Error code " + exception.Number
                            + ": " + exception.Message + "</p>");
                    }
                    conn.Close();


                }  // End of if statement
            }// end of else

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = "Data Source=itksqlexp8;Initial Catalog=Capstone_ISA;"
                                      + "Integrated Security=true";
            try
            {
                connection.Open();

                String user = txtuser.Text;
                String pass = txtpass.Text;
                SqlCommand cmd = new SqlCommand("SELECT userId,pass,isForgotPass FROM users WHERE userId = '" + user + "' and pass = '" + pass + "'", connection);

                SqlDataReader dr = null;
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    if (user == dr["userId"].ToString() && pass == dr["pass"].ToString())
                    {
                        Session["user_id"] = user;
                        bool b = (bool)dr["isForgotPass"];
                        if (b == true)
                        {
                            Response.Redirect("UpdatePassword.aspx");
                        }
                        else
                            Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    error.Text = "Invalid credentials!!";
                    ScriptManager.RegisterStartupScript(this, GetType(), "script", "getLoginModal();", true);
                   
                }
                connection.Close();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}