using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISA_Project.CommonPages
{
    public partial class DonateItems : System.Web.UI.Page
    {
        string ISAconnectionString = "Server=itksqlexp8;Database=Capstone_ISA;Integrated Security=true;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

                sqlCommandEmp.Parameters.AddWithValue("@itemName", itemName.Text);
                sqlCommandEmp.Parameters.AddWithValue("@itemPrice", itemPrice.Text);
                sqlCommandEmp.Parameters.AddWithValue("@itemdesc", desc);
                sqlCommandEmp.Parameters.AddWithValue("@userId", userid);
                sqlCommandEmp.Parameters.AddWithValue("@categoryPrefix", categoryPrefix);

                string actualPath = "";
                if (imgUpload.FileName != "")
                {
                    string path = Server.MapPath("~/Images/");
                    imgUpload.SaveAs(path + imgUpload.FileName);
                    actualPath = "~/Images/" + imgUpload.FileName;
                   
                    lblStatus.Text = "Image sucessfully uploaded";
                }
                //else
                //{
                //    //lblStatus.Text = "";
                //    lblStatus.Text = "Please enter Image..!!";
                //    lblStatus.Text += System.Drawing.Color.Red;
                 
                //}

                sqlCommandEmp.Parameters.AddWithValue("@filePath", actualPath);
                int count= sqlCommandEmp.ExecuteNonQuery();

                // Image Upload
                //ImageUpload(itemId.Text);
                
                    Label1.Text = "Item Successfully Donated...!!";
               

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }  // end of method

  



    }
}
