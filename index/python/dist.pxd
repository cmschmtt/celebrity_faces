from python.node cimport Node


cdef extern from "dist.h" namespace "nsw":
    cdef cppclass Distance:
        Distance()
    cdef cppclass Distance_l1(Distance):
        Distance_l1()
        float operator()(const Node* node1, const Node* node2) except +
    cdef cppclass Distance_l2(Distance):
        Distance_l2()
        float operator()(const Node* node1, const Node* node2) except +


cdef class PyDistance_l1:
    cdef Distance_l1 dist


cdef class PyDistance_l2:
    cdef Distance_l2 dist
