using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class CartTemp
    {
        //用户编号
        public int UserId { get; set; }
        //缩略图
        public string Thumbnail { get; set; }
        //商品名称
        public string GoodsName { get; set; }
        //商品编号
        public int GoodsID { get; set; }
        //商品单价
        public double GoodsPrice { get; set; }
        //商品数量
        public int GoodsNumber { get; set; }
        //商品小计
        public double CountPrice { get; set; }
        //总计
        public double TotalPrice { get; set; }
        //购物车编号
        public int CartID { get; set; }
    }
}
