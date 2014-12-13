import pyhop


#OPERATORS
#def drive_to(state, robot, goal):
#    #if state.loc[robot] == start:
#    state.loc[robot]  = goal
#    return state
    #else: return False

#def load(state, loc, shelf, robot):#
#    if (state.loc[robot] == shelf.loc[shelf]):
#        state.loc[shelf] = robot
#        return state
#    else:
#         return state

#def at(state, x, y):
#  if state.loc[x]==y:
#    return state #already there, nothing to do
#  elif x == 'robot':
#    return [('drive_to', x, y)]
#  else: return false


def bring(state, product, loc):
    state.loc[product]=loc
    return state

def pick(state, product):
    if (product in state.loc
        and 'Picker' in state.loc
        and state.loc[product] == state.loc['Picker']):
        del state.loc[product]
        return state
    else: return False



pyhop.declare_operators(bring, pick)
#pyhop.print_operators()


#METHODS
def send(state, product):
    if not (product in state.loc
        and 'Picker' in state.loc
        and state.loc[product] == state.loc['Picker']):
        return [('bring', product, state.loc['Picker']),
                ('pick', product)]
    else: return [('pick', product)]


pyhop.declare_methods('send', send)
#pyhop.print_methods()


#INITIAL STATE
state1 = pyhop.State('state1')
state1.loc = {}
state1.loc['Picker']='pl'
state1.loc['p1'] = 'pl'

#GOAL
#pyhop.pyhop(state1,[('at', 'robot', 'l1')],verbose=3)
#pyhop.pyhop(state1,[('drive_to', 'robot', 'l2')],verbose=3)
pyhop.pyhop(state1,[('send', 'p1')],verbose=3)
#
