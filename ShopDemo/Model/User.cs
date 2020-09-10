using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class User
    {
        //用户编号
        public int UserID { get; set; }
        //用户姓名
        public string UserName { get; set; }
        //用户密码
        public string Password { get; set; }
        //邮箱
        public string Email { get; set; }
    }
}
