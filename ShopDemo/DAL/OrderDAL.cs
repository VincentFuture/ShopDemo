using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Data.SqlClient;
namespace DAL
{
    public class OrderDAL
    {
        DBHelper db = new DBHelper();
        public int InsertOrder(Order order)
        {
            //添加订单，查询出添加的这个订单编号，并返回
            string sql = "insert into [Order](UserID,OrderStatus,OrderMsg,OrderAmount,CreateTime) values(" +
                order.UserID + "," + order.OrderStatus + ",'" + order.OrderMsg + "'," + order.OrderAmount + ",'" + order.CreateTime + "');" + "select SCOPE_IDENTITY()";
            
 
            //int rows = db.ExecuteNonQuery(sql);
            int orderId = Convert.ToInt32(db.ExecuteScalar(sql));

            db.Close();
            return orderId;
        }
        //添加orderGoods
        public int AddOrderGoods(List<OrderGoods> ogList)
        {
            int rows = 0;
            foreach (OrderGoods og in ogList)
            {
                //
                string sql = "insert into [OrderGoods](OrderID,GoodsID,GoodsNumber) values(" + og.OrderID + "," + og.GoodsID
                    + "," + og.GoodsNumber + ")";
                db.ExecuteNonQuery(sql);
                rows++;
            }
            db.Close();
            return rows;

        }
        //查询我的订单
        public List<OrderInfo> ShowMyOrder(int userId)
        {
            string sql = "select o.CreateTime,o.OrderID,g.Thumbnail,og.GoodsNumber,g.GoodsName,o.OrderAmount ,o.OrderStatus from [Order] o ,[Goods] g ,[OrderGoods] og where og.OrderID=o.OrderID and g.GoodsID=og.GoodsID and o.UserID=" + userId;
            SqlDataReader sdr = db.ExecuteReader(sql);
            //创建订单信息集合，存储查询结果
            List<OrderInfo> ofList = new List<OrderInfo>();
            while (sdr.Read())
            {
                //新建订单信息对象
                OrderInfo of = new OrderInfo();
                //封装数据
                of.OrderID = Convert.ToInt32(sdr["OrderID"]);
                of.OrderPay = Convert.ToDouble(sdr["OrderAmount"]);
                of.OrderStatus = Convert.ToInt32(sdr["OrderStatus"]);
                of.GoodsName = sdr["GoodsName"].ToString();
                of.GoodsNumber = Convert.ToInt32(sdr["GoodsNumber"]);
                of.Thumbnail = sdr["Thumbnail"].ToString();
                of.CreateTime = sdr["CreateTime"].ToString();
                ofList.Add(of);
            }
            //释放资源
            db.Close();
            return ofList;
        }

    }
}
