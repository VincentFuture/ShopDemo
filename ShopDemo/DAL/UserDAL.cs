using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data.SqlClient;
//DAL数据链路层
//链接数据库和查询数据的类库
namespace DAL
{
    public class UserDAL
    {
        DBHelper db = new DBHelper();
        //获取数据库中所有的用户信息
        public List<User> getUsers() { 
            string sql = "select * from users";
            //调用查询方法，查询用户信息，并返回结果集
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建List集合，存放User对象
            List<User> users = new List<User>();
            while(sdr.Read())
            {
                //创建User对象，封装数据
                User user = new User();
                user.UserID = Convert.ToInt32(sdr["UserID"]);
                user.UserName = sdr["UserName"].ToString();
                user.Password = sdr["Password"].ToString();
                user.Email = sdr["Email"].ToString();
                //将user对象添加到List对象中
                users.Add(user);
            }
            //释放资源
            db.Close();
            return users;

        }
        //根据用户名查询用户信息
        public List<User> getUsersByName(string username)
        {
            string sql = "select * from users where 1=1";
            //判断参数是否为空
            if (username != "" && username != null)
            {
                sql = sql + "and UserName like'%" + username + "%'";//优化模糊查询
            }
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建List集合，存放User对象
            List<User> users = new List<User>();

            while (sdr.Read())
            {
                //创建User对象，封装数据
                User user = new User();
                user.UserID = Convert.ToInt32(sdr["UserID"]);
                user.UserName = sdr["UserName"].ToString();
                user.Password = sdr["Password"].ToString();
                user.Email = sdr["Email"].ToString();
                //将user对象添加到List对象中
                users.Add(user);
            }
            db.Close();
            return users;
        }
        //用户登录
        public User loginUser(string loginUser, string loginPwd)
        {
            string sql = "select * from users where UserName='" + loginUser + "' and Password='"+loginPwd+"'";
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建一个User对象
            User user = null;
            while (sdr.Read())
            {
                //如果查询到了用户，登录成功，实例化对象
                user = new User();
                user.UserID = Convert.ToInt32(sdr["UserID"]);
                user.UserName = sdr["UserName"].ToString();
                user.Password = sdr["Password"].ToString();
                user.Email = sdr["Email"].ToString();
            }
            db.Close();
            return user;

        }
        public int insertUser(User user)
        {
            string sql = "insert users(UserName,Password,Email) values ('"+user.UserName+"','"+user.Password+"','"+user.Email+"')";
            //执行sql语句，返回受影响的行数
            int rows = db.ExecuteNonQuery(sql);
            //释放资源
            db.Close();
            return rows;
        }
        public User checkUserName(string username){
            string sql = "select * from users where UserName='"+username+"'";
            //调用查询方法，查询用户信息，并返回结果集
           
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建User对象,封装用户数据
            User users = null;

            while (sdr.Read())
            {
                //创建User对象，封装数据
                User user = new User();
                user.UserID = Convert.ToInt32(sdr["UserID"]);
                user.UserName = sdr["UserName"].ToString();
                user.Password = sdr["Password"].ToString();
                user.Email = sdr["Email"].ToString();
               
            }
            db.Close();
            return users; 
        }
        public User checkEmail(string email)
        {
            string sql = "select * from users where UserName='" + email + "'";
            //调用查询方法，查询用户信息，并返回结果集

            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建User对象,封装用户数据
            User users = null;

            while (sdr.Read())
            {
                //创建User对象，封装数据
                User user = new User();
                user.UserID = Convert.ToInt32(sdr["UserID"]);
                user.UserName = sdr["UserName"].ToString();
                user.Password = sdr["Password"].ToString();
                user.Email = sdr["Email"].ToString();

            }
            //释放资源
            db.Close();
            return users;
        }

    }
}
