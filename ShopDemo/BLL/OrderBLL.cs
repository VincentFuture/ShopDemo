using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using DAL;
namespace BLL
{
    public  class OrderBLL
    {
        OrderDAL od = new OrderDAL();
        public int InsertOrder(Order order) {
            return od.InsertOrder(order);    
        }
        public int AddOrderGoods(List<OrderGoods> ogList){
            return od.AddOrderGoods(ogList);
        }
        public List<OrderInfo> ShowMyOrder(int userId)
        {
            return od.ShowMyOrder(userId);
        }
        
    }
    
}
