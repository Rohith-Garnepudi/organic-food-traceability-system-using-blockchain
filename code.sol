pragma solidity >=0.4.22 <0.9.0;
contract FoodTraceability2 {
struct FoodItem {
string name;
uint256 price;
address payable farmer; address payable buyer;
address payable retailer; address payable consumer;

}
mapping (uint256 => FoodItem) public foodItems;
uint256 public foodItemCount e;
function addfoodItem(string memory _name, uint256 _price) public {
    foodItemCount++;
foodItems [foodItemCount] = FoodItem(_name, _price, payable (msg.sender), payable(address

function buyFoodItem(uint256 _id) public payable {
require(foodItemCount ›- _id 88 _id › 0, "Invalid food item ID*);
require(foodItems[_id].buyer = address(e), "Food item already sold");
require(msg.value ›= foodItems [_id].price, "Insufficient payment");
foodItems[_id].buyer - payable (msg-sender); foodItems [_id].farmer.transfer (msg.value);
function shipFoodItem (uint256 _id) public {
    require(foodItemCount ›= _id 88 _id › 0, "Invalid food item ID*);
require(foodItems[_id].buyer != address(e), "Food item not sold yet");
require(foodItems[_id].retailer == address(e), "Food item already shipped");
require(msg.sender - foodItems[_id].farmer, "Only the farmer can ship the food item");
foodItems[_id].retailer - payable(msg.sender);
}
function receivefoodItem(uint256_id) public {
require(foodItemCount §= id 88 id > 0,
"Invalid food item ID");
require(foodItems[_id].retailer I= address(e), "Food item not shipped yet");
require(foodItems [_id]. consumer as address (e), "Food item already received");
require(msg.sender == foodItems[_1d].buyer, "Only the buyer can receive the food item")
foodItems[_id]. consumer = payable(msg.sender);  
}
function getFoodItem(uint256 _id) public view returns(string memory, uint256, address, addr
    require(foodItemCount ›= _id 88 _id > 0, "Invalid food item ID");
    FoodItem memory item - foodItems[_id];
    return (item. name, item.price, item. farmer, item.buyer, item.retailer, item.consumer);
    }
    }