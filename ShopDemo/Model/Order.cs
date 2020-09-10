using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public  class Order
    {
        //订单编号
        public int OrderID { get; set; }
        //当前登录用户的编号
        public int UserID { get; set; }
        //订单状态 1.未付款 2.未发货 3.未收货 4.交易成功
        public int OrderStatus { get; set; }
        //定单信息
        public string OrderMsg { get; set; }
        //订单总金额
        public double OrderAmount { get; set; }
        //订单创建时间
        public string CreateTime { get; set; }
    }
}
