using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class Goods
    {
        //商品编号
        public int GoodsID { get; set; }
        //购物车编号
        public int CartID { get; set; }
        //商品名称
        public string GoodsName { get; set; }
        //商品库存
        public int GoodsStock { get; set; }
        //商品价格
        public double ShopPrice { get; set; }
        //商品描述
        public string Description { get; set; }
        //商品缩略图
        public string Thumbnail { get; set; }

    }
}
