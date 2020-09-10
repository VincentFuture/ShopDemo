using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public  class OrderGoods
    {
        //订单商品记录编号
        public int RecID { get; set; }
        //订单编号
        public int OrderID { get; set; }
        //商品编号
        public int GoodsID { get; set; }
        //商品数量
        public int GoodsNumber { get; set; }
    }
}
