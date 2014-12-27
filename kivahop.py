import pyhop



#INITIAL STATE
state1 = pyhop.State('state1')
state1.loc = {}
state1.loc['Picker']='pickerloc'
state1.loc['p1'] = 'l1'
state1.loc['p2'] = 'l2'
state1.loc['Robot'] = 'l3'

#This is soo bad, it hurts...
state1.type = {}
state1.type['Picker'] = 'Picker'
state1.type['p1'] = 'Product'
state1.type['p2'] = 'Product'
state1.type['Robot'] = 'Robot'


#HELPERS
def pickable(product):
    for p in state1.type:
        if (state1.type[p] == 'Picker'
        and state1.loc[p] == state1.loc[product]):
            return True
    return False


#OPERATORS
def pick(state, product):
    if (
    state.type[product]=='Product'

    and pickable(product)
    ):
        del state.loc[product]
        del state.type[product]
        return state
    else: return False

def load(state, robot, product):
    if (
    state.type[robot]=='Robot'
    and state.type[product]=='Product'
    and robot.loc == product.loc
    ):
        product.loc = ''
        robot.load = product
        return state
    else: return False

def unload(state, robot, product):
    if(
    state.type[robot]=='Robot'
    and state.type[product]=='Product'

    and robot.load == product
    ):
        robot.load = ''
        product.loc = robot.loc
        return state
    else: return False

def drive(state, robot, loc):
    if(
    state.type[robot]=='Robot'
    and state.type[loc]=='Location'
    ):
        robot.loc = loc
        return state
    else: return False

pyhop.declare_operators(drive, pick, load, unload)
#pyhop.print_operators()


#METHODS
def send(state, product):
    if pickable(product)):
        return [('pick', product)]
    else:
        return [('bring', product, state.loc['Picker']),
                ('pick', product)]


def bring(state, product, loc):
    if(state.loc[product] == 'Robot'):
        return [('dive', 'Robot', loc),#this may not be necessary
                ('unload', 'Robot', product)]
    else:
        return [('drive', 'Robot', state.loc[product]),#may not be necessary
                ('load', 'Robot', product),
                ('drive', 'Robot', loc),
                ('unload', 'Robot', product)]
    return state


pyhop.declare_methods('send', send)
pyhop.declare_methods('bring', bring)
#pyhop.print_methods()


#GOAL
#pyhop.pyhop(state1,[('at', 'robot', 'l1')],verbose=3)
#pyhop.pyhop(state1,[('drive_to', 'robot', 'l2')],verbose=3)
#pyhop.pyhop(state1,[('send', 'p1')],verbose=3)
pyhop.pyhop(state1,[('send', 'p1')],verbose=3)
#
