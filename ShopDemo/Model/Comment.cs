using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public  class Comment
    {
        //评论ID
        public int ComID { get; set; }
        //评论内容
        public string ComCont { get; set; }
        //用户ID
        public int UserID { get; set; }
        //商品ID
        public int GoodsID { get; set; }
        //用户名
        public string UserName { get; set; }
    }
}
