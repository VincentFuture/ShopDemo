using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data.SqlClient;

namespace DAL
{
    public class CartDAL
    {
        DBHelper db = new DBHelper();
        public int addCart(Cart cart)
        {
            string sql = "insert Cart(UserID,GoodsID,GoodsPrice,GoodsNumber) values(" + cart.UserID + "," + cart.GoodsID + "," + cart.GoodsPrice + "," + cart.GoodsNumber + ")";
            //执行sql语句
            int rows = db.ExecuteNonQuery(sql);
            //释放资源
            db.Close();
            return rows;
        }
        public List<CartTemp> showCart(int UserId)
        {
            /*
             * 
                select  Thumbnail,GoodsName,GoodsPrice,GoodsNumber，[Cart].GoodsID   from Cart  c,Goods  g
                where g.GoodsID=c.GoodsID and c.UserID=1*/
            string sql = "select c.GoodsID,c.CartID,g.Thumbnail,g.GoodsName,g.ShopPrice,c.GoodsNumber " +
                        "from Cart c,Goods g "+
                        "where g.GoodsID=c.GoodsID and c.UserID="+UserId;//UserId用于确认当前用户的购物车
            //执行sql
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建List集合,存储查询的数据
            List<CartTemp> cartTemp = new List<CartTemp>();
            while(sdr.Read()){
                CartTemp ct = new CartTemp();
                ct.UserId = UserId;
                ct.CartID = Convert.ToInt32(sdr["CartID"]);
                ct.GoodsName = sdr["GoodsName"].ToString();
                ct.Thumbnail = sdr["Thumbnail"].ToString();
                ct.GoodsID = Convert.ToInt32( sdr["GoodsID"]);
                ct.GoodsPrice = Convert.ToDouble(sdr["ShopPrice"]);
                ct.GoodsNumber =Convert.ToInt32(sdr["GoodsNumber"]);
                //将对象添加到集合中
                cartTemp.Add(ct);
            }
            db.Close();
            return cartTemp;
        }
        public Cart FindCartByGoodsId(int goodsId){
            string sql = "select * from Cart where GoodsID=" + goodsId;
            SqlDataReader sdr = db.ExecuteReader(sql);
            Cart cart = null;
            while (sdr.Read())
            {
                cart = new Cart();
                cart.CartID = Convert.ToInt32(sdr["CartID"]);
                cart.UserID = Convert.ToInt32(sdr["UserID"]);
                cart.GoodsID = Convert.ToInt32(sdr["GoodsID"]);
                cart.GoodsNumber = Convert.ToInt32(sdr["GoodsNumber"]);
                cart.GoodsPrice = Convert.ToDouble(sdr["GoodsPrice"]);
            }
            db.Close();
            return cart;
        }
        //修改商品购物车中商品的数量
        public int UpdateGoodsNumber(int goodsId,int goodsNum){
            string sql = "update Cart set GoodsNumber=GoodsNumber+" + goodsNum + " where GoodsID=" + goodsId;
            int rows = db.ExecuteNonQuery(sql);
            db.Close();
            return rows;
        }
        //根据购物车编号删除商品
        public int DeleteCartByCartId(int cartId)
        {
            string sql = "delete from Cart where CartID=" + cartId;
            int rows = db.ExecuteNonQuery(sql);
            db.Close();
            return rows;
        }
        //根据用户ID删除用户购物车订单信息
        public int DeleteCartByUserId(int userId)
        {
            string sql = "delete from Cart where UserID="+userId;
            int rows = db.ExecuteNonQuery(sql);
            db.Close();
            return rows;
        }
        //根据购物车编号查询商品的编号和数量
        public List<Cart> getByCartId(string[] cIds)
        {
            //
            string sql = "select * from [Cart] where CartID in(";
            StringBuilder strBuilder = new StringBuilder(sql);
            foreach(string cid in cIds){
                //
                if(!"".Equals(cid)){
                    
                    strBuilder.Append(Convert.ToInt32(cid)).Append(",");
                }
            }
            
            sql = strBuilder.ToString();
            sql = sql.Substring(0, sql.Length - 1);
            sql = sql + ")";

            SqlDataReader sdr = db.ExecuteReader(sql);
            List<Cart> carts = new List<Cart>();
            while (sdr.Read())
            {
                Cart cart = new Cart();
                cart.CartID = Convert.ToInt32(sdr["CartID"]);
                cart.UserID = Convert.ToInt32(sdr["UserID"]);
                cart.GoodsID = Convert.ToInt32(sdr["GoodsID"]);
                cart.GoodsNumber = Convert.ToInt32(sdr["GoodsNumber"]);
                cart.GoodsPrice = Convert.ToDouble(sdr["GoodsPrice"]);

                carts.Add(cart);
            }
            db.Close();
            return carts;

        }
        
    }
}
