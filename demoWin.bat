#KNN

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import accuracy_score

# Load and prepare data
df = pd.read_csv('C://Users/sies/Downloads/diabetess.csv')

# Extract features and labels
X = df[['Glucose', 'BloodPressure']].values
y = df['Outcome'].values

# Standardize the features
X = StandardScaler().fit_transform(X)

# Split dataset into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Initialize and train KNN
knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(X_train, y_train)

# Predict the test set
y_pred = knn.predict(X_test)

# Calculate and print accuracy score
asc = accuracy_score(y_test, y_pred)
print("Accuracy score:", asc)

# Plot decision boundary
h = 0.2
x_min, x_max = X[:, 0].min() - 1, X[:, 0].max() + 1
y_min, y_max = X[:, 1].min() - 1, X[:, 1].max() + 1
xx, yy = np.meshgrid(np.arange(x_min, x_max, h), np.arange(y_min, y_max, h))
Z = knn.predict(np.c_[xx.ravel(), yy.ravel()]).reshape(xx.shape)

plt.contourf(xx, yy, Z, alpha=0.3, cmap='coolwarm')
plt.scatter(X[:, 0], X[:, 1], c=y, edgecolor='k', cmap='coolwarm')
plt.title('KNN Decision Boundary')
plt.xlabel('Glucose')
plt.ylabel('Blood Pressure')
plt.show()
========================================================================================================
#BFS

from collections import deque

def bfs(graph, start):
    visited = set()  # Set to keep track of visited nodes
    queue = deque([start])  # Initialize a queue with the start node
    visited.add(start)  # Mark the start node as visited

    while queue:
        vertex = queue.popleft()  # Dequeue a vertex
        print(vertex, end=' ')  # Process the current vertex

        # Iterate over the neighbors of the current vertex
        for neighbor in graph[vertex]:
            if neighbor not in visited:
                visited.add(neighbor)  # Mark the neighbor as visited
                queue.append(neighbor)  # Enqueue the neighbor

# Example graph as an adjacency list
graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D', 'E'],
    'C': ['A', 'F'],
    'D': ['B'],
    'E': ['B', 'F'],
    'F': ['C', 'E']
}

print("BFS traversal starting from vertex 'A':")
bfs(graph, 'A')
==========================================================================================================
#neuron computation

import numpy as np

# Define the neuron computation
def neuron(inputs, weights, bias):
    # Compute the weighted sum
    weighted_sum = np.dot(inputs, weights) + bias
    print(f"Weighted sum: {weighted_sum}")
    
    # Activation function (step function)
    if weighted_sum > 0:
        print("Output is 1")
    else:
        print("Output is 0")

# Input values
inputs = [0.2, 0.3]
weights = [0.2, 0.5]
bias = 0.5  # Bias should be a scalar, not a list

# Call the neuron function
neuron(inputs, weights, bias)
====================================================================================================
#linear regression


import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error

# Load the dataset
df = pd.read_csv("C://Users/admin/Documents/diabetess.csv")

# Prepare the data
X = df.drop('Outcome', axis=1)
y = df['Outcome']

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create a Linear Regression model
model = LinearRegression()
model.fit(X_train, y_train)

# Prediction
y_pred = model.predict(X_test)

# Calculate Mean Squared Error
mse = mean_squared_error(y_test, y_pred)
print("Mean Squared Error is", mse)

# Plot outputs
plt.figure(figsize=(10,6))
plt.scatter(y_test, y_pred, color='blue', alpha=0.6)
plt.plot([y_test.min(), y_test.max()], [y_test.min(), y_test.max()], 'k--', lw=2)
plt.xlabel('Actual')
plt.ylabel('Predicted')
plt.title('Actual vs Predicted')
plt.show()
========================================================================================================
#decision tree 


# Import libraries
import numpy as np
from sklearn.tree import DecisionTreeClassifier
import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn import tree
import matplotlib.pyplot as plt

# Read data
def importdata(path='C://Users/admin/Documents/PlayTennis.csv'):
    data = pd.read_csv(path, header=0)
    print("Dataset Length:", len(data))
    print("Dataset Shape:", data.shape)
    return data

# Load the PlayTennis dataset
playtennis_data = importdata()

# Encoding categorical data using LabelEncoder
le = LabelEncoder()
playtennis_data['outlook'] = le.fit_transform(playtennis_data['outlook'])
playtennis_data['temp'] = le.fit_transform(playtennis_data['temp'])
playtennis_data['humidity'] = le.fit_transform(playtennis_data['humidity'])
playtennis_data['windy'] = le.fit_transform(playtennis_data['windy'])
playtennis_data['play'] = le.fit_transform(playtennis_data['play'])

# Defining features (X) and target (y)
X = playtennis_data[['outlook', 'temp', 'humidity', 'windy']]
y = playtennis_data['play']

# Create Decision Tree Classifier with criterion as 'entropy'
tree1 = DecisionTreeClassifier(criterion='entropy', random_state=0)
var = tree1.fit(X, y)

# Plot the tree
plt.figure(figsize=(12,8))  # Resize plot for better readability
tree.plot_tree(var, filled=True, feature_names=['outlook', 'temp', 'humidity', 'windy'], class_names=['No', 'Yes'], rounded=True, fontsize=10)
plt.title('Decision Tree for PlayTennis Dataset')
plt.show()

==================================================================================================================================================
#IDDFS

dict_hn = {
    "Arad": 336, "Bocharest": 0, "Craiova": 160, "Dobreta": 242, "Eforie": 161,
    "Fagaras": 178, "Giurgiu": 77, "Hirsova": 151, "Iasi": 226, "Lugoj": 244,
    "Mehadia": 241, "Neamt": 234, "Oradea": 380, "Pitesti": 98, 
    "Riminca_Vilcea": 193, "Sibiu": 253, "Timisoara": 329, "Urziceni": 80, 
    "Vaslui": 199, "Zerind": 374
}

dict_gn = dict(
    Arad=dict(Zerind=75, Timisoara=118, Sibiu=140),
    Bucharest=dict(Urziceni=85, Giurgiu=90, Pitesti=101, Fagaras=211),
    Craiova=dict(Dobreta=120, Riminca_Vilcea=146, Pitesti=138),
    Dobreta=dict(Craiova=120, Mehadia=75),
    Eforie=dict(Hirsova=86),
    Fagaras=dict(Sibiu=99, Bucharest=211),
    Giurgiu=dict(Bucharest=90),
    Hirsova=dict(Eforie=86, Urziceni=98),
    Iasi=dict(Neamt=87, Vaslui=92),
    Lugoj=dict(Mehadia=70, Timisoara=111),
    Mehadia=dict(Dobreta=75, Lugoj=70),
    Neamt=dict(Iasi=87),
    Oradea=dict(Zerind=71, Sibiu=151),
    Pitesti=dict(Riminca_Vilcea=97, Bucharest=101, Craiova=138),
    Riminca_Vilcea=dict(Pitesti=97, Craiova=146, Sibiu=80),
    Sibiu=dict(Oradea=151, Fagaras=99, Riminca_Vilcea=80),
    Timisoara=dict(Arad=118, Lugoj=111),
    Urziceni=dict(Bucharest=85, Vaslui=142, Hirsova=98),
    Vaslui=dict(Iasi=92, Urziceni=142),
    Zerind=dict(Arad=75, Oradea=71)
)

import queue as Q

start = 'Arad'
goal = 'Bucharest'
result = ''

# Depth-Limited Search (DLS) function
def DLS(city, visitedstack, startlimit, endlimit):
    global result
    found = 0
    result = result + city + ' '
    visitedstack.append(city)
    
    if city == goal:
        return 1
    
    if startlimit == endlimit:
        return 0
    
    for eachcity in dict_gn[city].keys():
        if eachcity not in visitedstack:
            found = DLS(eachcity, visitedstack, startlimit + 1, endlimit)
            if found:
                return found
    return 0

# Iterative Deepening Depth-First Search (IDDFS) function
def IDDFS(city, visitedstack, endlimit):
    global result
    for i in range(0, endlimit):
        print("Searching at limit", i)
        found = DLS(city, visitedstack, 0, i)
        if found:
            print("Found")
            break
        else:
            print("Not Found!!!")
        print(result)
        print(" ------")
        result = ' '
        visitedstack = []

# Main function
def main():
    visitedstack = []
    IDDFS(start, visitedstack, 9)
    print("IDDFS Traversal from", start, "to", goal, "is:")
    print(result)

main()
========================================================================================================
#neuron computation using activation function

import numpy as np

# Define the neuron computation
def neuron(inputs, weights, bias, activation_function):
    # Compute the weighted sum
    weighted_sum = np.dot(inputs, weights) + bias
    print("Weighted Sum:", weighted_sum)
    
    # Apply the specified activation function
    if activation_function == 'sigmoid':
        output = 1 / (1 + np.exp(-weighted_sum))
    elif activation_function == 'relu':
        output = max(0, weighted_sum)
    elif activation_function == 'tanh':
        output = np.tanh(weighted_sum)
    elif activation_function == 'linear':
        output = weighted_sum
    else:
        raise ValueError("Unknown activation function")

    print("Final Output:", output)
    return output

# Example usage:
inputs = [0.2, 0.3]
weights = [0.2, 0.5]
bias = 0.5  # Should be a scalar, not a list

# Test with different activation functions
print("Activation Function: sigmoid")
output_sigmoid = neuron(inputs, weights, bias, activation_function='sigmoid')

print("\nActivation Function: relu")
output_relu = neuron(inputs, weights, bias, activation_function='relu')

print("\nActivation Function: tanh")
output_tanh = neuron(inputs, weights, bias, activation_function='tanh')

print("\nActivation Function: linear")
output_linear = neuron(inputs, weights, bias, activation_function='linear')
===============================================================================================
#DLS

# Define the graph as an adjacency list
def get_neighbors(city):
    graph = dict(
        Arad=dict(Zerind=75, Timisoara=118, Sibiu=140),
        Bucharest=dict(Urziceni=85, Giurgiu=90, Pitesti=101, Fagaras=211),
        Craiova=dict(Dobreta=120, Rimnicu_Vilcea=146, Pitesti=138),
        Dobreta=dict(Craiova=120, Mehadia=75),
        Eforie=dict(Hirsova=86),
        Fagaras=dict(Sibiu=99, Bucharest=211),
        Giurgiu=dict(Bucharest=90),
        Hirsova=dict(Eforie=86, Urziceni=98),
        Iasi=dict(Neamt=87, Vaslui=92),
        Lugoj=dict(Mehadia=70, Timisoara=111),
        Mehadia=dict(Dobreta=75, Lugoj=70),
        Neamt=dict(Iasi=87),
        Oradea=dict(Zerind=71, Sibiu=151),
        Pitesti=dict(Rimnicu_Vilcea=97, Bucharest=101, Craiova=138),
        Rimnicu_Vilcea=dict(Pitesti=97, Craiova=146, Sibiu=80),
        Sibiu=dict(Oradea=151, Fagaras=99, Rimnicu_Vilcea=80),
        Timisoara=dict(Arad=118, Lugoj=111),
        Urziceni=dict(Bucharest=85, Vaslui=142, Hirsova=98),
        Vaslui=dict(Iasi=92, Urziceni=142),
        Zerind=dict(Arad=75, Oradea=71)
    )
    return graph.get(city, {})

# Depth-Limited Search (DLS)
def dls(start, goal, depth):
    if start == goal:
        return True
    if depth <= 0:
        return False

    # Recur for all neighbors
    for neighbor in get_neighbors(start):
        if dls(neighbor, goal, depth - 1):
            return True
    return False

# Wrapper function for DLS
def depth_limited_search(start, goal, max_depth):
    return dls(start, goal, max_depth)

# Example usage
start_city = 'Arad'
goal_city = 'Bucharest'
max_depth = 5

if depth_limited_search(start_city, goal_city, max_depth):
    print(f"Path exists from {start_city} to {goal_city} within depth {max_depth}.")
else:
    print(f"No Path exists from {start_city} to {goal_city} within depth {max_depth}.")
=============================================================================================================
#A*-search

dict_hn = {
    'Arad': 366, 'Bucharest': 0, 'Craiova': 160, 'Doberata': 242, 'Eforie': 161, 
    'Fagaras': 178, 'Giurgiu': 77, 'Hirsova': 151, 'Iasi': 226, 'Lugoj': 244, 
    'Mehadia': 241, 'Neamt': 234, 'Oradea': 380, 'Piteshi': 98,
    'RimnicuVilcea': 193, 'Sibiu': 253, 'Timisoara': 329, 'Urziceni': 80, 
    'Vasiui': 199, 'Zerind': 374
}

dict_gn = dict(
    Arad=dict(Zerind=75, Timisoara=118, Sibiu=140),
    Bucharest=dict(Urziceni=85, Giurgiu=90, Pitesti=138, Nimicu=140),
    Craiova=dict(Doberata=120, Pitesti=138, Nimicu=140),
    Doberata=dict(Mehadia=75, Craiova=120),
    Eforie=dict(Hirsova=86),
    Fagaras=dict(Sibiu=99, Bucharest=211),
    Giurgiu=dict(Bucharest=90),
    Hirsova=dict(Eforie=86, Urziceni=98),
    Iasi=dict(Neamt=87, Vasiui=92),
    Lugoj=dict(Mehadia=70, Timisoara=111),
    Mehadia=dict(Lugoj=70, Doberata=75),
    Neamt=dict(Iasi=87),
    Oradea=dict(Zerind=71, Sibiu=151),
    Piteshi=dict(RimnicuVilcea=97, Bucharest=101, Craiova=138),
    RimnicuVilcea=dict(Sibiu=80, Piteshi=97, Craiova=146),
    Sibiu=dict(RimnicuVilcea=80, Fagaras=99, Arad=140, Oradea=151),
    Timisoara=dict(Lugoj=111, Arad=118),
    Urziceni=dict(Bucharest=86, Hirsova=98, Vasiui=142),
    Vasiui=dict(Iasi=92, Urziceni=142),
    Zerind=dict(Oradea=71, Arad=75)
)

import queue as Q

start = 'Arad'
goal = 'Bucharest'
result = " "

def get_fn(citystr):
    cities = citystr.split(" , ")
    hn = gn = 0
    for ctr in range(0, len(cities) - 1):
        gn = gn + dict_gn[cities[ctr]][cities[ctr + 1]]
    hn = dict_hn[cities[-1]]  # Get heuristic of the last city
    return hn + gn  # f(n) = g(n) + h(n)

def expand(cityq):
    global result
    tot, citystr, thiscity = cityq.get()
    
    if thiscity == goal:
        result = citystr + " : : " + str(tot)
        return
    
    for cty in dict_gn[thiscity]:
        cityq.put((get_fn(citystr + " , " + cty), citystr + " , " + cty, cty))
    
    if not cityq.empty():
        expand(cityq)

def main():
    cityq = Q.PriorityQueue()
    thiscity = start
    cityq.put((get_fn(start), start, thiscity))
    expand(cityq)
    print("The A* path with the total cost is: ")
    print(result)

main()
====================================================================================================================


##Pract10A
likes(mary,wine). 
likes(bob,beer). 
likes(vini,apple). 
likes(charlie,wine). 
likes(john,X):-likes(X,wine).

-------------------------------------------------
#Pract10B
female(pammi). 
female(lizza). 
female(patty). 
female(anny). 
male(jimmy). 
male(bobby). 
male(tomy). 
male(pitter). 
parent(pammi,bobby). 
parent(tomy,lizza). 
parent(tomy,lizza). 
parent(bobby,anny). 
parent(bobby,patty). 
parent(patty,jimmy). 
parent(pitter,jimmy). 
mother(X,Y):-parent(X,Y),female(X). 
father(X,Y):-parent(X,Y),male(X). 
haschild(X):-parent(X,_). 
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y. 
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.

------------------------------------------------------------------
###Maths Related Questions

rectangle_area(Width, Height, Area) :-
    Area is Width * Height.

sqrt_number(Number, Result) :-
    Result is sqrt(Number).

power(Number, Exponent, Result) :-
    Result is Number ** Exponent.

