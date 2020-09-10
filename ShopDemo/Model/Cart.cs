using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class Cart
    {
        //购物车编号
        public int CartID {get;set; }
        //用户编号
        public int UserID { get; set; }
        //商品编号
        public int GoodsID { get; set; }
        //商品单价
        public double GoodsPrice { get; set; }
        //商品数量
        public int GoodsNumber { get; set; }
        

    }
}
