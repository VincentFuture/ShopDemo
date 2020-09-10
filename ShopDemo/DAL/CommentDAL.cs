using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data.SqlClient;
namespace DAL
{
    
    public  class CommentDAL
    {
        DBHelper db = new DBHelper();
        //根据商品ID获取评论列表
        public List<Comment> getCommentByGoodsID(int goodsID)
        {
            string sql = "select c.*,u.UserName from [Comment] c ,[Users] u where c.UserID = u.UserID and GoodsID = " + goodsID;
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建List集合，存放Comment对象
            List<Comment> comments = new List<Comment>();
            while (sdr.Read())
            {
                //创建Comment对象，封装数据
                Comment comment = new Comment();
                comment.ComCont = sdr["ComCont"].ToString();
                comment.UserID = Convert.ToInt32(sdr["UserID"]);
                comment.UserName = sdr["UserName"].ToString();
                //把comment对象存放到comments列表
                comments.Add(comment);
            }
            //释放数据
            db.Close();
            return comments;
        }

    }
}
