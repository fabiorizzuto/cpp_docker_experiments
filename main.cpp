#include <iostream>
#include <thread>

int main() {
    std::cout << "Starting...." << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(2000));
    std::cout << "Pippo" << std::endl;
    return 0;
}
