using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ISA_Project
{
    public partial class PostComment : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                chatBox.Visible = false;
                noChatBox.Visible = true;
                //ScriptManager.RegisterStartupScript(this, GetType(), "script", "getLoginModal();", true);
                //ScriptManager.RegisterStartupScript(this, GetType(), "script", "<script>alert('Please login to access the page ! '); </script>", true);
            }
            else
            {
                chatBox.Visible = true;
                noChatBox.Visible = false;
                if (!IsPostBack)
                {
                    itemRepeater.DataSource = getPostComments();
                    itemRepeater.DataBind();

                    SqlConnection conn = new SqlConnection(ISAconnectionString);
                    conn.Open();
                    string SQLString = "SELECT DISTINCT categoryName,categoryPrefix FROM categories";

                    SqlCommand cmd = new SqlCommand(SQLString, conn);
                    SqlDataReader ddlValues = cmd.ExecuteReader();

                    ddl_categories.DataSource = ddlValues;
                    ddl_categories.DataValueField = "categoryPrefix";
                    ddl_categories.DataTextField = "categoryName";
                    ddl_categories.DataBind();

                    conn.Close();
                }
            }
        }

        protected void Page_LoadComplete   (object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                itemRepeater.DataSource = getPostComments();
                itemRepeater.DataBind();
                TextBox1.Text = String.Empty;
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            addPostComment();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Button senderId = (Button)sender;
            String itemId = senderId.CommandArgument.ToString();

            //getting Reperter item
            RepeaterItem item = senderId.NamingContainer as RepeaterItem;

            //Getting repeater            
            TextBox txt =  (TextBox)item.FindControl("TextBox2");
            String comment = txt.Text;
            
            addComment(itemId,comment);
        }

        void addPostComment()
        {
            string itemDesc = TextBox1.Text;
            string userId = Session["user_id"].ToString();
            string imgPath = "NoImage";

            SqlConnection conn = new SqlConnection(ISAconnectionString);
            conn.Open();
            //display those categories which user is not subscribed to

            //get item data
            String searchString = "insert into items (itemDesc,userId,itemImagePath) values ('" +
                                   itemDesc + "','" + userId + "','"+ imgPath + "')";

            //String searchString = "insert into items (itemDesc,userId) values ('" +
            //                        itemDesc + "','" + userId + "')";

            SqlCommand SQLString = new SqlCommand(searchString, conn);
            SQLString.ExecuteNonQuery();
            conn.Close();
        }



        void addComment(String itemId, String comment)
        {
            String itemDesc = TextBox1.Text;

            String userId = Session["user_id"].ToString();

            SqlConnection conn = new SqlConnection(ISAconnectionString);
            conn.Open();
            //display those categories which user is not subscribed to

            //get item data
            String searchString = "insert into comment (commentMsg,userId,itemId) values ('" +
                                   comment+"','" +
                                    userId + "','" + itemId + "')";

            SqlCommand SQLString = new SqlCommand(searchString, conn);
            SQLString.ExecuteNonQuery();
            conn.Close();
        }

        public DataTable getPostComments()
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                //display those categories which user is not subscribed to

                //get item data
                String searchString = "select itemId, case when(itemPrice = 0) then '' "+
                         " when(itemPrice != 0) then 'ItemPrice: $' + itemPrice end as itemPrice,"+
                         " case itemImagePath when 'NoImage' then 'false'else 'true' end as visibility,itemDesc,itemImagePath,items.userId, firstName, lastName, email " +
                                        "from items, users " +
                                        "where items.userId = users.userId order by itemId desc";
                

                   SqlCommand SQLString = new SqlCommand(searchString, conn);
                SqlDataAdapter da = new SqlDataAdapter(SQLString);
                DataTable dataItem = new DataTable();
                da.Fill(dataItem);
                conn.Close();
                
                return dataItem;
            }
            catch (SqlException exception)
            {
                //Response.Write("<p>Error code " + exception.Number
                //         + ": " + exception.Message + "</p>");
                throw;
            }
        }

        protected void ItemBound(object sender, RepeaterItemEventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            try
            {
                conn.Open();
                //display those categories which user is not subscribed to

                Repeater commentRepeater = (Repeater)e.Item.FindControl("commentRepeater");
                TextBox itemIdBox = e.Item.FindControl("itemId") as TextBox;
                String itemId = itemIdBox.Text;
                //get item data
                String searchString = "select commentId, commentMsg, firstName, lastName " +
                                        "from comment, users " +
                                        "where comment.userId = users.userId and" +
                                        " comment.itemId = '" + itemId + "';";

                SqlCommand SQLString = new SqlCommand(searchString, conn);
                SqlDataAdapter da = new SqlDataAdapter(SQLString);
                DataTable dataItem = new DataTable();
                da.Fill(dataItem);
                conn.Close();
                commentRepeater.DataSource = dataItem;
                commentRepeater.DataBind();                
            }
            catch (SqlException exception)
            {
                //Response.Write("<p>Error code " + exception.Number
                //         + ": " + exception.Message + "</p>");
                throw;
            }
        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ISAconnectionString);
            string desc = Request.Form["itemDesc"].ToString();

            string categoryPrefix = ddl_categories.SelectedValue;
            string userid = (string)Session["user_id"];
            // string userid = "aman";
            try
            {
                conn.Open();
                string query = "Insert INTO items (itemName,itemPrice,itemDesc,itemImagePath,userId,categoryPrefix)" +
                                "VALUES(@itemName,@itemPrice,@itemDesc,@filePath,@userId, @categoryPrefix)";
                SqlCommand sqlCommandEmp = new SqlCommand(query, conn);

                //sqlCommandEmp.Parameters.AddWithValue("@itemID", itemId.Text);
                sqlCommandEmp.Parameters.AddWithValue("@itemName", itemName.Text);
                sqlCommandEmp.Parameters.AddWithValue("@itemPrice", itemPrice.Text);
                sqlCommandEmp.Parameters.AddWithValue("@itemdesc", desc);
                sqlCommandEmp.Parameters.AddWithValue("@userId", userid);
                sqlCommandEmp.Parameters.AddWithValue("@categoryPrefix", categoryPrefix);

                string actualPath = null;
                if (imgUpload.PostedFile != null)
                {
                    string path = Server.MapPath("~/Images/");
                    imgUpload.SaveAs(path + imgUpload.FileName);
                    actualPath = "~/Images/" + imgUpload.FileName;
                }
                sqlCommandEmp.Parameters.AddWithValue("@filePath", actualPath);

                sqlCommandEmp.ExecuteNonQuery();

                // Image Upload
                //ImageUpload(itemId.Text);

                Label1.Text = "Item Successfully Donated...!!";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }  // end of method

        //
        // for file upload
        //
        //protected void ImageUpload(string temp)
        //{
        //    if (imgUpload.PostedFile != null)
        //    {
        //        string path = Server.MapPath("~/Images/");
        //        imgUpload.SaveAs(path + imgUpload.FileName);

        //        string actualPath = "~/Images/" + imgUpload.FileName;
        //        SqlConnection conn = new SqlConnection(ISAconnectionString);
        //        try
        //        {
        //            conn.Open();
        //            string strQuery = "Update items SET itemImagePath = @filePath where itemID = \'" + temp + "\'";
        //            SqlCommand cmd = new SqlCommand(strQuery, conn);
        //            cmd.Parameters.AddWithValue("@filePath", actualPath);
        //            cmd.CommandType = CommandType.Text;
        //            cmd.Connection = conn;

        //            cmd.ExecuteNonQuery();

        //            lblStatus.Text = "Image sucessfully uploaded";

        //        }
        //        catch (Exception ex)
        //        {
        //            Response.Write(ex.Message);
        //        }
        //    } // End of if Statement
        //} // End of Image Upload method




    }
}

       

