using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using DAL;
//逻辑业务层的类库
namespace BLL
{
    public class UserBLL
    {
        UserDAL ud = new UserDAL();
        public List<User> getUsers()
        {
            return ud.getUsers();


        }
        public List<User> getUsersByName(string username)
        {
            return ud.getUsersByName(username);
        }
        public User loginUser(string loginUser, string loginPwd)
        {
            return ud.loginUser(loginUser, loginPwd);
        }
        public int insertUser(User user)
        {
            return ud.insertUser(user);
        }
        public User checkUserName(string username)
        {
            return ud.checkUserName(username);
        }
        public User checkEmail(string email)
        {
            return ud.checkEmail(email);
        }
    }
}
