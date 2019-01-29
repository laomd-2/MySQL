from django.shortcuts import render, HttpResponse, get_object_or_404
from .models import OrderItem
from .forms import OrderCreateForm
from cart.cart import Cart
from .models import Order


def order_create(request):
    cart = Cart(request)
    if request.method == 'POST':
        form = OrderCreateForm(request.POST)
        try:
            if form.is_valid():
                order = form.save()     # 创建对应的订单
                for item in cart:   # 给每种商品创建一个明细
                    OrderItem.objects.create(
                        order=order,
                        product=item['product'],
                        price=item['price'],
                        quantity=item['quantity']
                    )
                cart.clear()
                return render(request, 'orders/order/created.html', {'order': order})
        except:
            old_order = get_object_or_404(Order, id=order.id)
            old_order.delete()
            return HttpResponse('404 剩余数量不够')
    else:
        form = OrderCreateForm()
    return render(request, 'orders/order/create.html', {'form': form})
