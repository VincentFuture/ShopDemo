using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class OrderInfo
    {
        //订单创建时间
        public string CreateTime { get; set; }
        //订单ID
        public int OrderID { get; set; }
        //商品缩略图
        public string Thumbnail { get; set; }
        //订单商品数量
        public int GoodsNumber { get; set; }
        //订单商品名称
        public string GoodsName { get; set; }
        //订单实付金额
        public double OrderPay { get; set; }
        //订单状态
        public int OrderStatus { get; set; }

    }
}
