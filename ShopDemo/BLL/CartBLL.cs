using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using DAL;

namespace BLL
{
    public class CartBLL
    {
        CartDAL cd = new CartDAL();
        public int addCart(Cart cart)
        {
            return cd.addCart(cart);
        }
        public List<CartTemp> showCart(int UserId)
        {
            return cd.showCart(UserId);
        }
        public Cart FindCartByGoodsId(int goodsId){
            return cd.FindCartByGoodsId(goodsId);
        }

        public int UpdateGoodsNumber(int goodsId,int goodsNum){
            return cd.UpdateGoodsNumber(goodsId,goodsNum);
        }
        public int DeleteCartByCartId(int cartId)
        {
            return cd.DeleteCartByCartId(cartId);
        }
        public int DeleteCartByUserId(int userId)
        {
            return cd.DeleteCartByUserId(userId);
        }
        public List<Cart> GetByCartId(string[] cIds)
        {
            return cd.getByCartId(cIds);
        }
    }
}
