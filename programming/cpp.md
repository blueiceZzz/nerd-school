## 	0. Configuration & Compilation

- C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.30.30705\bin\Hostx64\x64\cl.exe
- Cusomize formatting in VSCode: https://stackoverflow.com/questions/45823734/visual-studio-code-formatting-for
- Compiler path: Compiler:C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.30.30705/bin/Hostx64/x64/cl.exe
- When you want to compile with cl.exe, open "Developer command prompt for VS 2022" -> cd /d "C:\0Workspace\Jobsuche\coding-interview" -> code . . In this way, the path and environment for cl.exe gets set correctly

## 1. C++ language generals

- Determine OS: #if defined(WIN32) || defined(_WIN32) || defined(__WIN32) && !defined(__CYGWIN__) https://stackoverflow.com/questions/3213037/determine-if-linux-or-windows-in-c
- Lib (static lib) gets compiled and when included, also gets compiled into .exe. Dll(dynamic lib) does not get compiled in to .exe and gets called when the program runs, can be used by multiple programs at the same time. https://stackoverflow.com/questions/913691/dll-and-lib-files-what-and-why
- When automating calling the exe, all the path are referenced to the WorkspaceFolder, but in code, relative paths are referenced to the location of the exe file https://stackoverflow.com/questions/8068921/how-to-use-fstream-objects-with-relative-path
- std::random_shuffle() is deprecated: https://stackoverflow.com/questions/6926433/how-to-shuffle-a-stdvector
- Vscode trying to find some weird file in d:/a01/_work/…{vcr}… : 
    Map the path to your vc installation: 
    "sourceFileMap": {
        "d:\agent\_work\4\s\src\vctools\crt\runtime\src": "C:\MyPath\To\VCRuntime\src"
    }
    https://github.com/microsoft/vscode-cpptools/issues/5637
- std::streambuf: https://en.cppreference.com/w/cpp/io/basic_streambuf
    Tutorial save console log into string / file: http://www.cplusplus.com/forum/beginner/171317/
- Compilation and Linking process:
    Three step process: (https://www.youtube.com/watch?v=3tIqpEmWMLI)
        • processing: evaluate #if, #pragma, #define (subsitute first keyword with the second #define iNteGer int), #include(paste file at this position) -> .cpp
        • Compilation: .cpp -> translation unit -> .obj file, binaries
        • Linking: combing .obj files to a binary, link all the codes and function calls together
    Watch linking: How the C++ Linker Works
- different types of value (lvalue, rvalue etc.): https://en.cppreference.com/w/cpp/language/value_category temporaries (termed "rvalues", as they often lie on the right side of an assignment) were intended to never be modifiable. lvalue: on left side of assignment expression
- declaration & definition with initializer list / constructor: constructor function call better with (), initializer list for constructor better with {}, so it doesn't get confused with a function call.
- EXIT_SUCCESS, EXIT_FAILURE: return status of main function: Both EXIT_SUCCESS and the value zero indicate successful program execution status (see std::exit), although it is not required that EXIT_SUCCESS equals zero. https://en.cppreference.com/w/cpp/utility/program/EXIT_status
- static_cast: static_cast < new-type > ( expression ) (no std:: in the front, cause it is an expression)
- std::string::substr(pos, count!!!), or str.substr(0, str.find('Hi')): get string until (not including) ":", or str.substr(5): get sub substring from and including index 5. https://www.geeksforgeeks.org/substring-in-cpp/
- when a variable is a Object pointer, access the member of object via -> (= (*obj).member) !!!!! Simply saying: To access members of a structure / class object / union, use the dot operator. To access members of a structure through a pointer, use the arrow operator.
    ListNode* mergeTwoLists(ListNode* list1, ListNode* list2) {
    
    // do some empty check
    if (list1->next == nullptr && list2->next == nullptr) {
- **inheritance**:
    - call constructor with a pointer: use new + delete, also a object of an class is always a pointer: Shape* squa = new Square(5); // some other code... delete(squa); Another example of new: int *array = new int[10]  { 1,2,3,4,5,6,7,8,9,10 }; delete[] array;
    - new expression: Creates and initializes objects with dynamic storage duration, that is, objects whose lifetime is not necessarily limited by the scope in which they were created. so always DELETE(ptr); !!! https://en.cppreference.com/w/cpp/language/new
        - The new expression attempts to allocate storage and then attempts to construct and initialize either a single unnamed object, or an unnamed array of objects in the allocated storage. The new-expression returns a prvalue pointer to the constructed object or, if an array of objects was constructed, a pointer to the initial element of the array.
- noexcept operator: The noexcept operator performs a compile-time check that returns true if an expression is declared to not throw any exceptions. It can be used within a function template's noexcept specifier to declare that the function will throw exceptions for some types but not others.
- std::bitset<size_t n>: represents a fixed-size sequence of N bits. Bitsets can be manipulated by standard logic operators and converted to and from strings and integers. Access: [] operator: indexing from right to left. And so as for >>: right bitshift, make one bit smaller, << left shift, extend number with a '0' at the end.
- std::uint32_t: _t: Fixed width integer types. Thus, uint24_t denotes an unsigned integer type with a width of exactly 24 bits.
- why using namespace x/std; is a bad practice: https://stackoverflow.com/questions/1452721/why-is-using-namespace-std-considered-bad-practice/1453605#1453605
- float number declaration: f after a number literal makes it a float: float a = 2.5f; without f, it will be a double.
- function, pass by pointer (int *a) or pass by reference (int& a): Difference Between Reference Variable and Pointer Variable: A reference is the same object, just with a different name and a reference must refer to an object. Since references can’t be NULL, they are safer to use. https://www.geeksforgeeks.org/passing-by-pointer-vs-passing-by-reference-in-c/
- char: value -127 to 127 or 0 to 255
- smart pointers: they have automated reference counter, and release / delete the object if no reference points to it anymore (also happens when the smart_ptrs go out of scope) -> avoids memory leaks.
    - std::shared_ptr<class T> sPtr = std::make_shared<class T>(constrParam); : std::shared_ptr is a smart pointer that retains shared ownership of an object through a pointer. Several shared_ptr objects may own the same object. 
    - std::unique_ptr<class T> uPtr = std::make_unique(constrParam); : is a smart pointer that owns and manages another object through a pointer and disposes of that object when the unique_ptr goes out of scope. 
    - std::weak_ptr is a smart pointer that holds a non-owning ("weak") reference to an object that is managed by std::shared_ptr. It must be converted to std::shared_ptr with .lock(), in order to access the object.
    - if pointer of object, access of member is also -> (like normal pointer)
    - example: in a double-linked-list, firstPtr, nextPtr can be std::shared_ptr, prevPtr and lastPtr can be std::weak_ptr, so for release, only the shared_ptr needs to be released, the weak_ptr gets released automatically
- template (class): 
    - example for matrix: 
    'Matrix.hpp'
    template <typename Scalar, unsigned int Rows, unsigned int Cols> class Matrix { // type and two other params
     public: 
        Matrix() {
            for (unsigned int row = 0; row < Rows; row++>) {
                for (unsigned int col = 0; row < Rows; row++>) {
                    data[row][col] = static_cast<Scalar>(0);
                }
            }
        }
     private:
        std::array<std::array<Scalar, Cols>, Rows> data{};
    }

    #include <string>
    #include "Matrix.hpp"
    int main() {
        Matrix<double, 3, 2> emptyMatrix;
        Matrix<std::string, 2, 1> strMtx;
    }
- [[nodiscard]] int funcName () {}: no discard: C++17 introduces the [[nodiscard]] attribute, which allows programmers to mark functions in a way that the compiler produces a warning if the returned object is discarded by a caller; the same attribute can be added to an entire class type.
- in .hpp files: don't forget include guard like: #pragma once
- class inheritance: 
    - public: baseClass public -> derivedClass public, baseClass protected -> derivedClass protected, baseClass private: not inheritable
    - protected: baseClass public -> derivedClass protected, baseClass protected -> derivedClass protected, baseClass private: not inheritable
    - private: baseClass public -> derivedClass private, baseClass protected -> derivedClass private, baseClass private: not inheritable
    - syntax:
    class baseC {};
    class derivedC : baseC {};
- .lib and .dll: the needed libs are important for the linker 
    - .lib: static libraries: Libraries are used because you may have code that you want to use in many programs. 
    - .dll: Dynamic libraries take this one step further. It seems wasteful to have multiple copies of the library functions taking up space in each of the programs. Why can't they all share one copy of the function?
- Function override in class inheritance:
    - virtual: could be overriden: vitual - override - final
    class Base
    {
    public:
        virtual void f()
        {
            std::cout << "Base class default behaviour\n";
        }
    };

    class Derived : public Base
    {
    public:
        void f() override
        {
            std::cout << "Derived class overridden behaviour\n";
        }
    };    
    - override a non-virtual function: it is allowed and not a problem, only polymorphism won't be applied, so it will behave like a normal class method. https://stackoverflow.com/questions/11067975/overriding-non-virtual-methods
    - pure virtual and abstract class: virtual funcName (param) = 0; this makes a class an abstract class, and this method has to be implemented in the derived class. It cannot be instantiated. E.g. we declare a Shape class and a pure virtual function draw() in it. Because we cannot draw a Shape but we know we can draw every object of a derived class from Shape. https://www.geeksforgeeks.org/pure-virtual-functions-and-abstract-classes/
- macros: #define identifier replacement-list: The #define directives define the identifier as macro, that is instruct the compiler to replace all successive occurrences of identifier with replacement-list. 
    - so when are macros beneficial? It mostly is in C, not C++. In-lined functions, consts and templates are usually a safer and superior alternative to a #define. https://stackoverflow.com/questions/96196/when-are-c-macros-beneficial 
- class const member functions: cannot alter any class members retType funcName(param) const;: https://stackoverflow.com/questions/3141087/what-is-meant-with-const-at-end-of-function-declaration
    - all about "const" keyword: use to a variable, function return type, pointer, function param and so on: http://duramecho.com/ComputerInformation/WhyHowCppConst.html
- typedef: 

## 2. Data structures & STL lib

- std::vector: std::vector is a sequence container that encapsulates dynamic size arrays.
    - void emplace_back() vs. void push_back(): emplace_back forwards the arguments directly, push_back creates a tempirary object and calls copy after that: https://stackoverflow.com/questions/4303513/push-back-vs-emplace-back
    - std::vector<int> a{2}; -> initializer list -> "{2}", std::vector<int> b(2); -> constructor vector(std::size_t size) -> "{0, 0}"
    - access elements: at(or []), front(), back(), data() (returns pointer to the underlying array serving as element storage)
    - insert at beginning: v.insert(v.begin(), 6); https://stackoverflow.com/questions/48251254/how-can-i-insert-element-into-beginning-of-vector
    - .size() <= .capacity()
    - iterator insert(iterator pos, const T& value): add a value at position. iterator insert( const_iterator pos, InputIt first, InputIt last ): concatenate two vectors
    - iterator arithmetic: use + /++: It works if the iterator is a random access iterator, which vector's iterators are (see reference). The STL function std::advance(inputIt, distance) can be used to advance a generic iterator, but since it doesn't return the iterator, I tend use + if available because it looks cleaner. C++11 note: Now there is std::next and std::prev, which do return the iterator, so if you are working in template land you can use them to advance a generic iterator and still have clean code. https://stackoverflow.com/questions/1033089/can-i-increment-an-iterator-by-just-adding-a-number 
        - random access iterators: Random-access iterators are iterators that can be used to access elements at an arbitrary offset position relative to the element they point to, offering the same functionality as pointers. https://www.geeksforgeeks.org/random-access-iterators-in-cpp/
    - best way to get a sub vector with index range: use iterator constructor, it's O(N), but there isn't really a better way: std::vector<int> a {1,2,3,4,5}; std::vector<int> b(a.begin()+1, a.begin()+3);
- std::list: 
    - (normally) double linked list https://en.cppreference.com/w/cpp/container/list
    - access of elements: front(), back()
- std::set: associative container that contains a sorted set of unique objects of type Key. Sorting is done using the key comparison function Compare.
- std::map<x, y>: std::map gets sorted with the keys. When iterating, it iterates through a bunch of std::pair<const x, y>, access both elemnt with "bItr = begin(mapVar);b
bItr->first; / bItr->second;
- std::unordered_map: 
    - hash table (https://en.wikipedia.org/wiki/Hash_table), access: key -> hash code -> value. It is a structure that can map keys to values. A hash table uses a hash function to compute an index, also called a hash code, into an array of buckets or slots, from which the desired value can be found. During lookup, the key is hashed and the resulting hash indicates where the corresponding value is stored. Ideally, the hash function will assign each key to a unique bucket, but most hash table designs employ an imperfect hash function, which might cause hash collisions where the hash function generates the same index for more than one key. Such collisions are typically accommodated in some way.
    - unordered_map::find member function: iterator find( const Key& key ); (e.g.if (uMap.find("Paul") != uMap.end())). std::find(): template< class InputIt, class T > InputIt find( InputIt first, InputIt last, const T& value ); (e.g. if (std::find(begin(v), end(v), n1) != v.end()))
    - iterator std::unordered_map::find(const Key& key): time complexity: constant on average, worst case linear in the size of the container.
    In a well-dimensioned hash table, the average cost (number of instructions) for each lookup is independent of the number of elements stored in the table.
- iterator: access its value: *itr, like a pointer
    // std::find requires an input iterator
    auto range = Range<15, 25>();
    auto itr = std::find(range.begin(), range.end(), 18);
    std::cout << *itr << '\n'; // 18
- std::move: move reference of a variable
- && in parameter list: It is called an rvalue reference, and it is new in C++11. It binds to temporaries without making a copy. Often used in a move constructor https://stackoverflow.com/questions/8424064/what-does-mean-with-a-parameter-type-in-c C++11 adds a new non-const reference type called an rvalue reference, identified by T&&. This refers to temporaries that are permitted to be modified after they are initialized, for the purpose of allowing "move semantics". https://en.wikipedia.org/wiki/C%2B%2B11#Rvalue_references_and_move_constructors
- std::queue<class T>: FIFO structure. 
    - The queue pushes the elements on the back of the underlying container and pops them from the front (.push(t), .pop()). Access: front(): returns the reference to the first element in queue. Used to do breadth-first-traversal aka. level-order-traversal of a tree. https://www.geeksforgeeks.org/level-order-tree-traversal/
    printLevelorder(tree)
    1) Create an empty queue q
    2) temp_node = root /*start from root*/
    3) Loop while temp_node is not NULL
        a) print temp_node->data.
        b) Enqueue temp_node’s children 
        (first left then right children) to q
        c) Dequeue a node from q.
- std::deque<class T>: (double-ended queue) FIFO, but offers random access. 
    - push_back(), push_front(), pop_back(), pop_front()
    - diff to vector: One main difference between vectors and deques is that the latter allows efficient insertion at the front of the structure as well as the back.
    Deques also do not guarantee that their elements are contiguous in memory so the at-style operator (indexing) may not be as efficient. https://stackoverflow.com/questions/22068188/the-difference-between-vector-and-deque
- typedef: typedef is a reserved keyword in the programming languages C and C++. It is used to create an additional name (alias) for another data type, but does not create a new type: https://en.wikipedia.org/wiki/Typedef
    The syntax of the typedef declaration is: typedef type-declaration;
    The name of the new type alias follows the same syntax as declaring any other C identifier, therefore, in more detailed form: typedef type-definition identifier;
    e.g.: typedef unsigned long ulong; // unsigned long is recognized as the typename
     typedef int int_t, *intp_t, (&fp)(int, ulong), arr_t[10]; // list of alias

    In the C standard library and in POSIX specifications, the identifier for the typedef definition is often suffixed with _t, such as in size_t and time_t. This is practiced in other coding systems, although POSIX explicitly reserves this practice for POSIX data types. 
- *.h and *:hpp file: use *.hpp for *.cpp file, then you can tell from file extension, which language the class / lib is implemented in. *.h is c/c++ compatible: https://stackoverflow.com/questions/152555/h-or-hpp-for-your-class-definitions

## 3. Algos and Performance ##

- for performance critical application, try to utilize stack memory over heap, cause the memory is contiguous


## 4. Others ##

- Error: cannot bind a lvalue reference to a temporary. Use const keyword to fix it.
    - Line 82: Char 22: error: non-const lvalue reference to type 'vector<...>' cannot bind to a temporary of type 'vector<...>'
        return merge(mergeSort(left), mergeSort(right));
                     ^~~~~~~~~~~~~~~
    Line 21: Char 36: note: passing argument to parameter 'left' here
        vector<int> merge(vector<int>& left, vector<int>& right) {
                                    ^
    1 error generated.
    - Fix:     vector<int> merge(const vector<int>& left, const vector<int>& right) {
- stack & heap: both in RAM
    - stack: for e.g. int val = 5; The memory is continuous. Variables allocated on stack are freed with the end of the scope.
    - heap: dynamically allocatable. For e.g. int* a = new int{1, 2, 3, 4, 5}; (delete[] a;) or use smart pointer, which has automatically memory management. 
    - stack overflow: In software, a stack overflow occurs if the call stack pointer exceeds the stack bound (processor dependent, normally around 2MB). The call stack may consist of a limited amount of address space, often determined at the start of the program. 
    - allocating on stack is just move the stack pointer because the memory is continuous (one CPU instruction). But allocating on heap is much more expensive, and requires a lot of book keeping. Allocation is the main performance difference for stack and heap.
    - to be clear, each program/process on our computer has its own stack/heap
    - each thread will create its own stack when it gets created, whereas the heap is shared amongst all threads    
- big endian & little endian:
    - big endian means the most signigicant byte is at the beginning. so 00 0A is 10. little endian save the most significant byte at the end. so 00 0A is 10 * 16 * 16 = 2560. Notice inside one Byte, it always reads like a human (right to left, ascending)
    - most of modern computers use little endian. 