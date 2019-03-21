pragma solidity >=0.4.22 <0.6.0;

contract DataSaver
{
    // This declares a new complex type which will
    // be used for variables later.
    // It will represent a single voter.
    struct dataFood
    {
        uint ID; // weight is accumulated by delegation
        string FoodName;
        string CompanyName;
        //address CompanyAddress; // person delegated to
        uint dataCount;
        string date;   // index of the voted proposal
    }

    // This is a type for a single proposal.
    struct Proposal {
        bytes32 name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }

    address public CompanyAddress;
    //Store dataFood 向这个mapping中添加数据就会修改状态，存入到区块链中
    //相当于一个数组 通过datafood（ID）来访问对应的数据
    mapping(uint => dataFood) public datafood;
    //记录mapping中数据的数量
    uint public dataCount;
    //私有链所有节点都需要权限进行写入    暂时设计为public

    /* function newData(uint ID , bytes32 FoodName, bytes32 CompanyName,bytes32 date ) public
    {
      dataCount++;
      datafood[dataCount] = dataFood(ID,FoodName,CompanyName,dataCount,date);
    } */
    function newData(uint ID , string memory FoodName, string memory CompanyName,string memory date ) public
    {
      dataCount++;
      datafood[ID] = dataFood(ID,FoodName,CompanyName,dataCount,date);
    }

    function Test() public
    {
      datafood[1] = dataFood(112,'测试物品','哈尔滨工业大学',dataCount,'2019.3.14');
    }

    /* function TestInput(uint ID , bytes32 FoodName, bytes32 CompanyName,bytes32 date) public
    {
      datafood[ID] = dataFood(ID,FoodName,CompanyName,dataCount,date);
    } */



    // May only be called by `CompanyAddress`.
    function giveRightToAddData(address companyAddress) public
    {
        require(
            msg.sender == companyAddress,
            "Only CompanyAddress can give right to add data."
        );
    }

}
