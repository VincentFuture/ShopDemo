using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    public class DBHelper
    {
        /// <summary>
        /// 数据库连接字符串
        /// </summary>
        private const string ConnectionString = @"server=.;uid=sa;pwd=123456;database=MyShop";

        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataAdapter da = null;
        SqlDataReader dr = null;

        /// <summary>
        /// 公共的SqlConnection链接对象
        /// </summary>
        private SqlConnection GetConnection()
        {
            if (con == null)
            {//设计模式--单例模式
                con = new SqlConnection(ConnectionString);
                con.Open();
            }
            return con;
        }
        /// <summary>
        /// 关闭所有数据库操作对象
        /// </summary>
        public void Close()
        {
            if (da != null)
            {
                da.Dispose();
                da = null;
            }
            if (dr != null)
            {
                dr.Dispose();
                dr = null;
            }
            if (cmd != null)
            {
                cmd.Dispose();
                cmd = null;
            }
            if (con != null)
            {
                con.Close();
                con = null;
            }
        }

        /// <summary>
        /// 根据sql语句执行数据库增删改
        /// </summary>
        /// <param name="sql">SQL增删改语句</param>
        /// <returns>受影响行数</returns>
        public int ExecuteNonQuery(string sql)
        {
            cmd = new SqlCommand(sql, this.GetConnection());
            return cmd.ExecuteNonQuery();
        }


        /// <summary>
        /// 根据sql语句返回第一行第一列的值
        /// </summary>
        /// <param name="sql">只返回一个结果的sql语句</param>
        /// <returns>第一行第一列的值</returns>
        public object ExecuteScalar(string sql)
        {
            cmd = new SqlCommand(sql, this.GetConnection());
            return cmd.ExecuteScalar();
        }



        /// <summary>
        /// 执行SQL语句,返回SqlDataReader
        /// </summary>
        /// <param name="sql">SQL查询语句</param>
        /// <returns>SqlDataReader</returns>
        public SqlDataReader ExecuteReader(string sql)
        {
            cmd = new SqlCommand(sql, this.GetConnection());
            dr = cmd.ExecuteReader();
            return dr;
        }

        /// <summary>
        /// 执行SQL语句,返回DataTable.
        /// </summary>
        /// <param name="sql">SQL查询语句</param>
        /// <returns>DataTable</returns>
        public DataSet ExecuteDataSet(string sql)
        {
            da = new SqlDataAdapter(sql, this.GetConnection());
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

    }
}
