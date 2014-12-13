import pyhop

#OPERATORS
def drive_to(state, robot, goal):
#    #if state.loc[robot] == start:
    state.loc[robot]  = goal
    return state
    #else: return False

pyhop.declare_operators(drive_to)
#pyhop.print_operators()


#METHODS
def at(state, x, y):
  if state.loc[x]==y:
    return []
  else: return [('drive_to', x, y)]

pyhop.declare_methods('at', at)
#pyhop.print_methods()


#INITIAL STATE
state1 = pyhop.State('state1')
state1.loc = {'robot':'l1'}


#GOAL
#pyhop.pyhop(state1,[('at', 'robot', 'l1')],verbose=3)
pyhop.pyhop(state1,[('drive_to', 'robot', 'l2')],verbose=3)