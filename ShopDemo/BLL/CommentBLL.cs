using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
namespace BLL
{
    public  class CommentBLL
    {
        CommentDAL cd = new CommentDAL();
        public List<Comment> getCommentByGoodsID(int goodsID)
        {
            return cd.getCommentByGoodsID(goodsID);
        }
    }
}
