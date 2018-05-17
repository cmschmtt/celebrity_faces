cdef class PyNode:
    def __cinit__(self):
        self.node = new Node()

    def __dealloc__(self):
        del self.node

    @property
    def coord(self):
        return self.node.getCoord()

    @coord.setter
    def coord(self, const vector[float]& new_coord):
        self.node.setCoord(new_coord)

    @property
    def file_path(self):
        return self.node.getPath()

    @file_path.setter
    def file_path(self, const string& new_file_path):
        self.node.setPath(new_file_path)


def create_node(const string& file_path, const vector[float]& coord):
    cdef PyNode node = PyNode()
    node.file_path = file_path
    node.coord = coord
    return node
