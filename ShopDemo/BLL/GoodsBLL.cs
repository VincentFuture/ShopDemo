using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Model;
namespace BLL
{
    public class GoodsBLL
    {
        GoodsDAL gd = new GoodsDAL();

        public List<Goods> getGoodsList()
        {
            return gd.getGoodsList();
        }
        public List<Goods> getGoodsByGoodsName(string goodsName)
        {
            return gd.getGoodsByGoodsName(goodsName);
        }
        public int AddGoods(Goods goods)
        {
            return gd.AddGoods(goods);
        }
        public int DeleteGoodsByID(int GoodsId)
        {
            return gd.DeleteGoodsByID(GoodsId);
        }
        public Goods FindGoodsByGoodsId(int GoodsId) {
            return gd.FindGoodsByGoodsId(GoodsId);
        }
        public int UpdataGoods(Goods goods)
        {
            return gd.UpdataGoods(goods);
        }
        public List<Goods> getgoodsByName(string goodsN)
        {
            return gd.getgoodsByName(goodsN);
        }

    }
}
