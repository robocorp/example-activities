import pandas


class Orders:
    def get_orders(self, excel):
        data_frame = pandas.read_excel(excel)
        orders = []
        for row in data_frame.values:
            order = {
                "item": row[1],
                "zip": row[2],
                "first_name": row[0].split()[0],
                "last_name": row[0].split()[1]
            }
            orders.append(order)
        return orders
