using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using Model;

namespace DAL
{

    public class GoodsDAL
    {
        DBHelper db = new DBHelper();
        //获取商品信息
        public List<Goods> getGoodsList()
        {
            string sql = "select * from Goods";
            //调用查询方法
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建list集合存放good对象
            List<Goods> goodsList = new List<Goods>();
            //遍历结果集
            while (sdr.Read())
            {
                //创建good对象，封装数据
                Goods good = new Goods();
                good.GoodsID = Convert.ToInt32(sdr["GoodsID"]);
                good.CartID = 1;//Convert.ToInt32(sdr["CartID"]);
                good.GoodsName = sdr["GoodsName"].ToString();
                good.GoodsStock = Convert.ToInt32(sdr["GoodsStock"]);
                good.ShopPrice = Convert.ToDouble(sdr["ShopPrice"]);
                good.Thumbnail = sdr["Thumbnail"].ToString();
                good.Description = sdr["Description"].ToString();
                //添加good对象到list集合中
                goodsList.Add(good);
            }
            db.Close();
            return goodsList;
        }

        //更据商品名称模糊查询
        public List<Goods> getGoodsByGoodsName(string goodsName)
        {
            string sql = "select * from Goods where 1=1";
            //判断商品名称是否为空
            if (goodsName != null || !"".Equals(goodsName))
            {
                //不为空
                sql = sql + " and GoodsName like '%" + goodsName + "%'";
            }
            //执行sql语句
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建list集合存放good对象
            List<Goods> goodsList = new List<Goods>();
            //遍历结果集
            while (sdr.Read())
            {
                //创建good对象，封装数据
                Goods good = new Goods();
                good.GoodsID = Convert.ToInt32(sdr["GoodsID"]);
                good.CartID = 1;//Convert.ToInt32(sdr["CartID"]);
                good.GoodsName = sdr["GoodsName"].ToString();
                good.GoodsStock = Convert.ToInt32(sdr["GoodsStock"]);
                good.ShopPrice = Convert.ToDouble(sdr["ShopPrice"]);
                good.Thumbnail = sdr["Thumbnail"].ToString();
                good.Description = sdr["Description"].ToString();
                //添加good对象到list集合中
                goodsList.Add(good);
            }
            db.Close();
            return goodsList;
        }
        //添加商品
        public int AddGoods(Goods goods)
        {
            string sql = "insert into Goods(GoodsName,GoodsStock,ShopPrice,Description,Thumbnail) values('"
                + goods.GoodsName + "'," + goods.GoodsStock + "," + goods.ShopPrice + ",'" + goods.Description + "','" + goods.Thumbnail + "')";
            //执行sql语句
            int rows = db.ExecuteNonQuery(sql);
            //释放资源
            db.Close();
            return rows;
        }
        //根据商品ID删除商品信息
        public int DeleteGoodsByID(int GoodsId)
        {
            //编写sql语句
            string sql = "delete from Goods where GoodsID=" + GoodsId;
            //执行sql语句，返回受影响的行数
            int rows = db.ExecuteNonQuery(sql);
            db.Close();
            return rows;
        }
        //根据商品ID查询商品信息
        public Goods FindGoodsByGoodsId(int GoodsId)
        {
            string sql = "select * from Goods where GoodsID=" + GoodsId;
            //执行SQL
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建一个Goods对象,封装查询结果
            Goods goods = null;
            while (sdr.Read())
            {
                goods = new Goods();

                goods.GoodsID = Convert.ToInt32(sdr["GoodsID"]);
                goods.GoodsName = sdr["GoodsName"].ToString();
                goods.GoodsStock = Convert.ToInt32(sdr["GoodsStock"]);
                goods.ShopPrice = Convert.ToDouble(sdr["ShopPrice"]);
                goods.Thumbnail = sdr["Thumbnail"].ToString();
                goods.Description = sdr["Description"].ToString();

                //goods.CartID = 0;

                //string cartId = sdr["CartID"].ToString();

                if (!"".Equals(sdr["CartID"].ToString()) && sdr["CartID"].ToString() != null)
                {
                    goods.CartID = Convert.ToInt32(sdr["CartID"]);

                }
                else
                {
                    goods.CartID = 0;
                }

            }
            db.Close();
            return goods;
        }
        //修改商品信息
        public int UpdataGoods(Goods goods)
        {
            string sql = "update Goods set CartID="
                            + goods.CartID + ",GoodsName='" + goods.GoodsName + "',GoodsStock=" + goods.GoodsStock + ",ShopPrice="
                            + goods.ShopPrice + ",Description='" + goods.Description + "',Thumbnail='"
                            + goods.Thumbnail + "' where GoodsID=" + goods.GoodsID;
            int rows = db.ExecuteNonQuery(sql);
            db.Close();
            return rows;

        }
        //通过商品名模糊查询该商品
        public List<Goods> getgoodsByName(string goodsN)
        {
            string sql = "select * from Goods where 1=1";
            //判断商品名是否为空
            if (goodsN != null || goodsN != "")
            {
                //拼接sql语句
                sql = sql + "and GoodsName like '%" + goodsN + "%'";
            }
            //执行sql语句
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建List集合，存储查询结果
            List<Goods> goods = new List<Goods>();
            while (sdr.Read())
            {
                //创建Goods对象，封装数据
                Goods good = new Goods();
                good.GoodsName = sdr["GoodsName"].ToString();
                good.ShopPrice = Convert.ToDouble(sdr["ShopPrice"]);
                good.Thumbnail = sdr["Thumbnail"].ToString();
                goods.Add(good);
            }
            db.Close();
            return goods;
        }
       
    }
}
