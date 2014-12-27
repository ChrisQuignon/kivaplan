import pyhop


#OPERATORS
def pick(state, product):
    if (product in state.loc
        and 'Picker' in state.loc
        and state.loc[product] == state.loc['Picker']):
        del state.loc[product]
        return state
    else: return False

def load(state, robot, product):
    if (state.loc[robot] == state.loc[product]):
        state.loc[product] = robot
        return state
    else: return False

def unload(state, robot, product):
    if(state.loc[product] == robot):
        state.loc[product] = state.loc[robot]
        return state
    else: return False

def drive(state, robot, loc):
    state.loc[robot] = loc
    return state

pyhop.declare_operators(drive, pick, load, unload)
#pyhop.print_operators()


#METHODS
def send(state, product):
    if not (product in state.loc
        and 'Picker' in state.loc
        and state.loc[product] == state.loc['Picker']):
        return [('bring', product, state.loc['Picker']),
                ('pick', product)]
    else: return [('pick', product)]


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


#INITIAL STATE
state1 = pyhop.State('state1')
state1.loc = {}
state1.loc['Picker']='pickerloc'
state1.loc['p1'] = 'l1'
state1.loc['p2'] = 'l2'
state1.loc['Robot'] = 'l3'

#GOAL
#pyhop.pyhop(state1,[('at', 'robot', 'l1')],verbose=3)
#pyhop.pyhop(state1,[('drive_to', 'robot', 'l2')],verbose=3)
#pyhop.pyhop(state1,[('send', 'p1')],verbose=3)
pyhop.pyhop(state1,[('send', 'p1'), ('send', 'p2')],verbose=3)
#
