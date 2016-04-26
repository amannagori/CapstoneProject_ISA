using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project.CommonPages
{
    public partial class ItemSubscription : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    BindDataToSubscribeList();
            //    BindDataToUnSubscribeList();
            //}
        }

        protected void Page_LoadComplete(object sender, EventArgs e)
        {
           // if (!IsPostBack)
           // {
                BindDataToSubscribeList();
                BindDataToUnSubscribeList();
          //  }
        }

        protected void BindDataToSubscribeList()
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                string userid = (string)Session["user_id"];
                //display those categories which user is not subscribed to

                String searchString = "select categoryName, categoryPrefix "
                                       + " from categories "
                                        + " where categoryPrefix Not in ( select c.categoryPrefix "
                                       + "  from categories c, itemSubscriberCategory sc, users u "
                                       + "  where(c.categoryPrefix = sc.categoryPrefix "
                                       + "  and sc.email = u.email) "
                                       + "  and u.userId = @userID) ";

                SqlCommand SQLString = new SqlCommand(searchString, conn);
                 SQLString.Parameters.AddWithValue("@userID", userid);

                SqlDataAdapter da = new SqlDataAdapter(SQLString);

                DataTable dt = new DataTable();
                da.Fill(dt);
                subList.DataSource = dt;
                subList.DataValueField = "categoryName";
                subList.DataTextField = "categoryName";
                subList.DataBind();
                //SqlDataReader sdr = SQLString.ExecuteReader();

                //while (sdr.Read())
                //{
                //    ListItem item = new ListItem();
                //    item.Text = sdr["categoryName"].ToString();
                //     subList.Items.Add(item);
                //}
                conn.Close();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                         + ": " + exception.Message + "</p>");

            }
        }  // End of BindDataToSubscribeList Method


        protected void BindDataToUnSubscribeList()
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                //display those categories which user is not subscribed to

                String searchString = "select c.categoryName, sc.email "
                                      + " from categories c, itemSubscriberCategory sc, users u"
                                      + " where c.categoryPrefix = sc.categoryPrefix"
                                      + " and u.email = sc.email"
                                      + " and u.userId = @userID ";

                SqlCommand SQLString = new SqlCommand(searchString, conn);
                SQLString.Parameters.AddWithValue("@userID", Convert.ToString(Session["user_id"]));

                SqlDataAdapter da = new SqlDataAdapter(SQLString);

                DataTable dt = new DataTable();
                da.Fill(dt);
                unsubList.DataSource = dt;
                unsubList.DataValueField = "categoryName";
                unsubList.DataTextField = "categoryName";
                unsubList.DataBind();

                conn.Close();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                         + ": " + exception.Message + "</p>");

            }
        } // End of BindDataToUnSubscribeList Method

        protected void subscribeBtnClick(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string categories = string.Empty;

                //loop through all categories in subscribe list
                foreach (ListItem item in subList.Items)
                {
                    //check if this category was selected
                    if (item.Selected)
                    {
                        //if (!checkDB(item.Text))
                        //{
                        categories += item.Text + ", ";
                        //invoke the subscribe method
                        subscribe(item.Text);
                        //}
                    }
                }
                if (categories != string.Empty && categories.Length > 1)
                {
                    categories = categories.Substring(0, (categories.Length - 2));
                    subscribeMsg.Text = "You have successfully subscribed to " + categories;
                    unsubscribeMsg.Text = "";
                    sendSubEmail(categories);
                }
            }
        }

        protected void unsubscribeBtnClick(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                string categories = string.Empty;

                //unsubscribe each selected category 
                foreach (ListItem item in unsubList.Items)
                {
                    if (item.Selected)
                    {
                        categories += item.Text + ", ";
                        //call method to unsubscribe
                        unsubscribe(item.Text);
                    }
                }
                if (categories.Length > 1)
                {
                    categories = categories.Substring(0, (categories.Length - 2));
                    unsubscribeMsg.Text = "You are no longer subscribed to : " + categories;
                    subscribeMsg.Text = "";
                }
            }
        } // end of unsubscribeBtnClick method



        protected void subscribe(string categoryName)
        {
            try
            {
                SqlConnection dbConnection = new SqlConnection(ISAconnectionString);
                dbConnection.Open();
               // dbConnection.ChangeDatabase("nasa_SilentAuction_v1");

                String searchString = "insert into itemSubscriberCategory "
                                       + " values((select categoryPrefix "
                                       + "  from categories "
                                       + "  where categoryName = @categoryName) "
                                       + "  ,(select email "
                                       + "  from users "
                                       + "  where userId = @userID)) ";

                SqlCommand SQLString = new SqlCommand(searchString, dbConnection);
                SQLString.Parameters.AddWithValue("@categoryName", categoryName);
                SQLString.Parameters.AddWithValue("@userID", Convert.ToString(Session["user_id"]));

                SQLString.ExecuteNonQuery();
                dbConnection.Close();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                         + ": " + exception.Message + "</p>");

            }
        }  // end of subscribe method

        protected void unsubscribe(string categoryName)
        {
            try
            {
                SqlConnection dbConnection = new SqlConnection(ISAconnectionString);
                dbConnection.Open();
               // dbConnection.ChangeDatabase("nasa_SilentAuction_v1");

                String searchString = "delete from subscriberCategory "
                                        + " where categoryPrefix in (select categoryPrefix "
                                        + " from categories "
                                        + " where categoryName = @categoryName) "
                                        + " and email = (select email "
                                        + " from users "
                                        + " where userId = @userID)";

                SqlCommand SQLString = new SqlCommand(searchString, dbConnection);
                SQLString.Parameters.AddWithValue("@categoryName", categoryName);
                SQLString.Parameters.AddWithValue("@userID", Convert.ToString(Session["user_id"]));

                SQLString.ExecuteNonQuery();

                dbConnection.Close();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                         + ": " + exception.Message + "</p>");

            }
        } //End of Method


        protected void sendSubEmail(string categories)
        {
            getEmailFromUserID();

            //string senderEmail = "njain12@ilstu.edu";
            //string senderName = "Nishant Kumar Jain";

            //compose new email
            MailMessage emailMessage = new MailMessage();

            ////set From address
            //MailAddress messageFrom = new MailAddress(senderEmail.ToLower(), senderName);
            //emailMessage.From = messageFrom;

            //set To address
            MailAddress messageTo = new MailAddress(Convert.ToString(Session["email"]));
            emailMessage.To.Add(messageTo.Address);

            //set the subject
            string subject = "Festival Of Trees - Silent Auction - New Subscription Confirmation";
            emailMessage.Subject = subject;

            emailMessage.IsBodyHtml = true;
            //set the message body
            string messageBody = "<br><p>Congratulations!</p>"
                + "<div style=\"clear:both\"><br /> You have now successfully subscribed to the following categories-<br />"
                + "<br /><b>" + categories.ToUpper() + "</b>"
                + "<br /> <br />You will receive updates if new items are added to your subscibed categories. "
                + "<br /><br /><br /> Thank You!"
                + "<br /><br /> Admin"
                + "<br />Silent Auction "
                + "<br />Festival Of Trees </div>";

            string htmlBody = "<div style=\"float:left\"><img src=\"cid:Pic1\" height=\"100px\" width=\"100px\" ></div><div style=\"float:left\">Hello,<b>"
                + Session["user_id"].ToString().ToUpper() + "</b></div> " + messageBody;
            AlternateView avHtml = AlternateView.CreateAlternateViewFromString
                (htmlBody, null, MediaTypeNames.Text.Html);

            // Create a LinkedResource object for each embedded image
            LinkedResource pic1 = new LinkedResource(Server.MapPath("~/CommonImages/fotLogo.jpg"));
            pic1.ContentId = "Pic1";
            avHtml.LinkedResources.Add(pic1);

            emailMessage.AlternateViews.Add(avHtml);

            //set the smtp client
            SmtpClient mailClient = new SmtpClient();
            mailClient.UseDefaultCredentials = true;// false;

            //send the email
            mailClient.Send(emailMessage);
        }  // End of Method


        protected string getEmailFromUserID()
        {
            try
            {
                SqlConnection dbConnection = new SqlConnection(ISAconnectionString);
                dbConnection.Open();
                //dbConnection.ChangeDatabase("nasa_SilentAuction_v1");

                String searchString = "select email from users where userId = @userID ";

                SqlCommand SQLString = new SqlCommand(searchString, dbConnection);
                SQLString.Parameters.AddWithValue("@userID", Convert.ToString(Session["user_id"]));

                SqlDataReader idRecords = SQLString.ExecuteReader();
                if (idRecords.Read())
                {
                    Session["email"] = idRecords["email"];
                }

                idRecords.Close();
                dbConnection.Close();
            }
            catch (SqlException exception)
            {
                Response.Write("<p>Error code " + exception.Number
                         + ": " + exception.Message + "</p>");

            }

            return "";
        } // End of Method



    } // End of class
} // End of namespace


   
