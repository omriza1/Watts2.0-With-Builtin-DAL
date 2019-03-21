using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Watts2._0_With_Builtin_DAL
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            userT.Focus();
        }

        protected void Rsub(object sender, EventArgs e)
        {
            if (DAL.buisness_logic.Register(userT.Text, passT.Text))
            {
                Session["user"] = userT.Text;
                Response.Redirect("pages/Home.aspx?username=" + userT.Text + "`&password=" + passT.Text + "`");
            }

        }
        protected void Lsub(object sender, EventArgs e)
        {
            if (DAL.UserMethods.userExist(userT.Text, passT.Text))
            {
                Session["user"] = userT.Text;
                Response.Redirect("pages/Home.aspx?username=" + userT.Text + "`&password=" + passT.Text + "`");
            }

        }
    }
}