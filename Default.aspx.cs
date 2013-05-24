using DevExpress.Web.ASPxPager;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            QueryData();
        }
    }

    private IList<Student> mockData = null;
    public IList<Student> MockData
    {
        get
        {
            if (mockData == null)
            {
                mockData = new List<Student>();

                for (int i = 1; i < 255; i++)
                {
                    mockData.Add(new Student()
                    {
                        SNumber = i,
                        Name = string.Format("学生{0}", i)
                    });
                }
            }

            return mockData;
        }
    }

    public class Student
    {
        public string Name
        {
            get;
            set;
        }
        public int SNumber
        {
            get;
            set;
        }
    }

    protected void QueryData()
    {
        string strName = txtBoxName.Text.Trim();

        var dataSource = from data in MockData select data;
        if (!string.IsNullOrEmpty(strName))
        {
            dataSource = from data in dataSource
                         where data.Name.Contains(strName)
                         select data;
        }

        //TODO: 注释此行
        Thread.Sleep(1000);

        pager.ItemCount = dataSource.Count();
        grid.DataSource = dataSource.Skip(pager.ItemsPerPage * pager.PageIndex).Take(pager.ItemsPerPage).ToList();
        grid.DataBind();
    }

    protected void btnQuery_Click(object sender, EventArgs e)
    {
        pager.PageIndex = 0;
        QueryData();
    }

    protected void pager_PageIndexChanged(object sender, EventArgs e)
    {
        QueryData();
    }
}