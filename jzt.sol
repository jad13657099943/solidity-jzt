
 pragma solidity ^0.5.1;
 
 library SafeMath {

  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return a / b;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}
 
 contract myToken {
     
     using SafeMath for uint256;
     
         uint256 decimals=18;
         mapping(address=>uint256)  pool;
         address payable []  owner;
         mapping(address=>uint256)  releases;
         mapping(address=>uint256)  total;
         mapping(address=>uint256)  pyramid;
         mapping(address=>uint256)  ptoken;
         mapping(address=>uint256)  fund;
         mapping(address=>uint256)  alreadyFund;
         uint256  ultimate=0;
         uint256  capitalPool=0;
         uint256  startFunds=0;
         uint256  endFunds=0;
         uint256  tier=1;
         uint256  token=50000;
         uint256  eth=1* 10 ** (decimals-1);
         mapping(address=>uint256)  time;
         address[] lastOwner;
         address payable technology;
         address payable advertising;
         address payable community;
         address payable withaddress;
         address payable my;
         mapping(address=>uint256)  numbers;
         uint256  ethNumber;
         uint256  tokenTime;
         mapping(address=>address) superior;
         mapping(address=>uint256)  recommend;
         mapping(address=>address[])  pid;
         mapping(address=>address[]) pids;
         mapping(address=>uint256[])  recommends;
         mapping(address=>uint256[])  recommendss;
         struct Record{
             uint256 num;
             address owers;
             uint256 time;
             uint256 number;
         } 
         mapping(address=>Record[])  urecord;
         uint256 investment;
        mapping(address=>uint256) superiorMoney;
        struct Last{
            address lowers;
            uint256 lnum;
        }
       Last[]  toLast; 
       mapping(address=>uint256) buyTokenEth;
       mapping(address=>uint256) buyEthToken;
       uint256 ethTime=86400;
       uint256 releaseTime=86400;
       mapping(address=>uint256) myMoney;    
         constructor(address payable _technology,address payable _advertising,address payable _community,address payable _withaddress, uint256 _timestmap) public {
             technology=_technology;
             advertising=_advertising;
             community=_community;
             withaddress=_withaddress;
             my=msg.sender;
             ethNumber=_timestmap;
              tokenTime=_timestmap;
         }
         function setAddress(address payable _technology,address payable _advertising,address payable _community) public {
             require(msg.sender==my);
               technology=_technology;
               advertising=_advertising;
               community=_community;
         }
         function getAddressBalance() public view returns(uint256){
              return address(this).balance;
         }
          function setEth(address _superior) public payable returns (bool success){
              if(_superior!=address(0x0)&&superior[msg.sender]==address(0x0)){
                    superior[msg.sender]=_superior;
                    recommend[_superior]=recommend[_superior].add(1);
              }
              require(msg.value>=0.5 ether);
              address payable _owner=msg.sender;
              uint256 _value=msg.value;
              require(pool[_owner].add(_value)>pool[_owner]);
                  if(pool[_owner]>0){
                       toRelease(_owner);
                  }
                  setEths();
                  investment=investment.add(_value);
                 uint256 num=_value.mul(5).div(100);
                 technology.transfer(num.mul(4).div(10));
                 advertising.transfer(num.mul(2).div(10));
                 community.transfer(num.mul(4).div(10));
              pool[_owner]=pool[_owner].add(_value.mul(95).div(100).mul(3)); 
               myMoney[_owner]=myMoney[_owner].add(_value.mul(95).div(100));
               toLast.push(Last(_owner,_value));
             capitalPool=capitalPool.add(_value.mul(95).div(100));
              if(numbers[_owner]==0){
                 uint256 ci=  (block.timestamp.sub(ethNumber)).div(releaseTime);
                  numbers[_owner]=ethNumber.add(ci.mul(releaseTime));
              }
              address _powner=superior[_owner];
               if( _powner!=address(0x0)){
                    uint256 nums=_value.mul(1).div(10);
                  numRelease(_powner,nums,_owner,1);
               }
                  uint8 state=0;
               for(uint256 i=0;i<owner.length;i++){
                   if(owner[i]==_owner){
                       state=1;
                   }
               }
               
               if(state==0){
                    owner.push(_owner);
               }
              return true;
          }
        
        
          
      
          
        function numRelease(address _owner,uint256 _num,address _owners,uint256 _number) private {
                if(total[_owner]<pool[_owner]){
                     if(total[_owner].add(_num)>pool[_owner]){
                         _num=pool[_owner].sub(total[_owner]);
                     }
                      releases[_owner]=releases[_owner].add(_num);
                      total[_owner]=total[_owner].add(_num);
                        if(myMoney[_owner]>_num){
                             myMoney[_owner]=myMoney[_owner].sub(_num);
                      }else{
                          myMoney[_owner]=0;
                      }
                     urecord[_owner].push(Record(_num,_owners,block.timestamp,_number));
                      superiorMoney[_owner]=superiorMoney[_owner].add(_num);
                 }   
          }
          
          function distribute(uint256 _num,uint256 _number,address _owner,uint256 _value,address _owners) private{
              if(_num==0){
                  numRelease(_owner,_value.mul(3).div(10),_owners,_num.add(1));
              }
              if(_num==1){
                  if(_number>=2){
                       numRelease(_owner,_value.mul(2).div(10),_owners,_num.add(1));
                  }
              }
              if(_num==2){
                   if(_number>=3){
                       numRelease(_owner,_value.mul(1).div(10),_owners,_num.add(1));
                  }
              }
                if(_num==3){
                   if(_number>=4){
                       numRelease(_owner,_value.mul(5).div(100),_owners,_num.add(1));
                  }
              }
               if(_num==4){
                   if(_number>=5){
                       numRelease(_owner,_value.mul(5).div(100),_owners,_num.add(1));
                  }
              }
               if(_num>=5&&_num<=9){
                   if(_number>=_num.add(1)){
                       numRelease(_owner,_value.mul(3).div(100),_owners,_num.add(1));
                  }
              }
              if(_num>=10&&_num<=19){
                  if(_number>=_num.add(1)){
                      numRelease(_owner,_value.mul(1).div(100),_owners,_num.add(1));
                  }
              }
              
          }
          function oneRelease(address _owner,address[] memory _owners,uint256[] memory _number,uint256 _day) private returns (bool success){
               if(total[_owner]<pool[_owner]){
                     uint256 num=pool[_owner].mul(4).div(1000).mul(_day);
                     if(total[_owner].add(num)>pool[_owner]){
                         num=pool[_owner].sub(total[_owner]);
                     }
                      releases[_owner]=releases[_owner].add(num);
                      total[_owner]=total[_owner].add(num);
                      if(myMoney[_owner]>num){
                             myMoney[_owner]= myMoney[_owner].sub(num);
                      }else{
                          myMoney[_owner]=0;
                      }
                   
                      for(uint256 i=0;i<_owners.length;i++){
                       distribute(i,_number[i],_owners[i],num,_owner);
                      }
                 } 
                 return true;
          }
           function unfreeze(uint256 _value) public payable returns (bool success){
                 address _owner=msg.sender;
                  toRelease(_owner);
                    setEths();
                 require(_value<=releases[_owner]);
                 require(msg.value==_value);
                 releases[_owner]=releases[_owner].sub(_value);
                 investment= investment.add(_value);
                  uint256 num =_value.mul(5).div(100);
                  technology.transfer(num.mul(4).div(10));
                 advertising.transfer(num.mul(2).div(10));
                 community.transfer(num.mul(4).div(10));
                  pyramid[_owner]=pyramid[_owner].add(_value.add((_value.mul(95).div(100))));
                  capitalPool=capitalPool.add(_value.mul(95).div(100));
                 return true;
           }
            function conversion(uint256 _value) public returns (bool success){
                require(_value>=1);
                require(token>_value);
                address _owner=msg.sender;
                 toRelease(_owner);
                 setEths();
                require(pyramid[_owner]>=eth.mul(_value));
                require(ptoken[_owner].add(_value)>ptoken[_owner]);
                pyramid[_owner]=pyramid[_owner].sub(eth.mul(_value));
                ptoken[_owner]=ptoken[_owner].add(_value);
                buyTokenEth[_owner]= buyTokenEth[_owner].add(eth.mul(_value));
                token=token.sub(_value);
                return true;
            }
             function conversions(uint256 _value) public returns (bool success){
                  require(_value>=1);
                   address _owner=msg.sender;  
                  require(ptoken[_owner]>=_value);
                   toRelease(_owner);
                    setEths();
                  ptoken[_owner]=ptoken[_owner].sub(_value);
                  fund[_owner]=fund[_owner].add(eth.mul(_value));
                  buyEthToken[_owner]=buyEthToken[_owner].add(_value);
                  return true;
             }
            function putUltimate() private returns(bool){
                if(capitalPool<=0){
                        uint256 length=owner.length;
                   for(uint256 i=0;i<length;i++){
                       owner[i].transfer(ultimate.div(length));
              }
                 ultimate=0;
                }
              return true;
            }
             function withdraw(uint256 _value) public payable returns (bool success){
                 address payable _owner=msg.sender;
                  toRelease(_owner);
                    setEths();
                 require(fund[_owner]>=_value);
                 require(address(this).balance>=_value);
                 require(capitalPool>=_value);
                 fund[_owner]=fund[_owner].sub(_value);
                 _owner.transfer(_value.mul(95).div(100));
                 ultimate=ultimate.add(_value.mul(5).div(100));
                 alreadyFund[_owner]=alreadyFund[_owner].add(_value);
                 capitalPool=capitalPool.sub(_value);
                 putUltimate();      
                  return true;
             }
            function redeem() public payable returns (bool success){
                address payable _owner=msg.sender;
                 toRelease(_owner);
                    setEths();
                    if(myMoney[_owner]>0){
                          require(alreadyFund[_owner]<=myMoney[_owner]);
                require(address(this).balance>=myMoney[_owner]);
                require(capitalPool>=myMoney[_owner]);
                 pool[_owner]=pool[_owner].sub(myMoney[_owner].mul(3));
                   _owner.transfer(myMoney[_owner].mul(8).div(10));
                     ultimate=ultimate.add(myMoney[_owner].mul(2).div(10));
                      capitalPool=capitalPool.sub(myMoney[_owner]);
                 myMoney[_owner]= myMoney[_owner].sub(myMoney[_owner]);
                  putUltimate();
                    }
                 return success;
            }
            function noRelease(address _owner) public view returns (uint256){
                   uint256 num=0;
                            if(total[_owner]<pool[_owner]){
                      uint256 day=(block.timestamp.sub(numbers[_owner])).div(releaseTime);
                      num=pool[_owner].mul(4).div(1000).mul(day);
                      if(total[_owner].add(num)>pool[_owner]){
                         num=pool[_owner].sub(total[_owner]);
                      }
                 } 
               uint256 nums=0;
               if(pool[_owner]<total[_owner].add(num)){
                   nums=0;
               }else{
                   nums=pool[_owner].sub((total[_owner].add(num)));
               }
               return  nums;
            }
             function tokens(address _owner) public view returns (uint256){
                 return ptoken[_owner];
             }
             function mayFunds(address _owner) public view returns (uint256){
                 return fund[_owner];
             }
              function getEth() public view  returns (uint256){
                   uint256 day= (block.timestamp.sub(tokenTime)).div(ethTime);
                   uint256 num=eth.add(day.mul((5 * 10 ** (decimals.sub(3)))));
                   if(num>=6 * 10 ** (decimals.sub(1))){
                       num=1* 10 ** (decimals.sub(1));
                   }
                  return num;
              } 
            function rise(uint256 _day) public{
                eth+=5 * 10 ** (decimals.sub(3)).mul(_day);
                if(eth>=6 * 10 ** (decimals.sub(1)) ){
                    tier=tier.add(1);
                    token=(tier.sub(1))*10000+50000;
                    eth=1 * 10 ** (decimals.sub(1));
                }
            }
              function setEths() private {  
                    uint256 day= (block.timestamp.sub(tokenTime)).div(ethTime);
                    if(day>=1){
                         tokenTime=tokenTime.add(ethTime.mul(day));
                        rise(day);
                    }
              }
              function getTier() public view returns (uint256){
                    uint256 tiers=tier;
                    uint256 day= (block.timestamp-tokenTime)/ethTime;
                   uint256 num=eth+day*(5 * 10 ** (decimals-3));
                   if(num>=6 * 10 ** (decimals-1)){
                       tiers=tier+1;
                   }
                  return tiers;
              }
              function getToken() public view returns (uint256){
                       uint256 Tokens=token;
                       uint256 day= (block.timestamp.sub(tokenTime)).div(ethTime);
                   uint256 num=eth+day*(5 * 10 ** (decimals.sub(3)));
                   if(num>=6 * 10 ** (decimals.sub(1))){
                       Tokens=tier.mul(10000).add(50000);
                   }
                  return Tokens;
              }
              function getBalance() public view returns (uint256){
                  return capitalPool;
              }
               function getBalances() public view returns(uint256){
                   return address(this).balance;
               }
               function getPool(address _owner) public view returns (uint256){
                   return pool[_owner];
               }
               function getSuperior(address _owner) public{
                   pid[_owner]=pids[_owner];
                   pid[_owner].push(superior[_owner]);
                   recommends[_owner]=recommendss[_owner];
                   recommends[_owner].push(recommend[superior[_owner]]);
                   for(uint256 i=0;i<20;i++){
                       if(pid[_owner][i]==address(0x0)){
                           break;
                       }
                     pid[_owner].push(superior[pid[_owner][i]]);
                     recommends[_owner].push(recommend[superior[pid[_owner][i]]]);
                   }
               }
             function getRelease(address _owner) public view  returns (uint256){
                     uint256 num=0;
                            if(total[_owner]<pool[_owner]){        
                      uint256 day=(block.timestamp.sub(numbers[_owner])).div(releaseTime);
                      num=pool[_owner].mul(4).div(1000).mul(day);
                      if(total[_owner].add(num)>pool[_owner]){
                         num=pool[_owner].sub(total[_owner]);
                      }
                 } 
                 return releases[_owner].sub(num);
             }
             function  toRelease(address _owner) private {
                  if(pool[_owner]>0){
                           uint256 day=(block.timestamp.sub(numbers[_owner])).div(releaseTime);
                    if(day>=1){
                         numbers[_owner]=numbers[_owner].add(releaseTime.mul(day));    
                    getSuperior(_owner);
                    oneRelease(_owner,pid[_owner],recommends[_owner],day);
                    }
                  }
             }
              function getPyramid(address _owner) public view returns (uint256){
                  return pyramid[_owner];
              }
              function getUltimate() public view returns (uint256){
                  return ultimate;
              }
             function getRecord(address _owner,uint256 _limit) public  view  returns (uint256[] memory,address[] memory,uint256[] memory,uint256[] memory){
                 require(_limit>=1);
                 if(urecord[_owner].length<_limit){
                     _limit=urecord[_owner].length;
                 }
                 uint256[] memory num=new uint256[](_limit);
                 address[] memory owers=new address[](_limit);
                 uint256[] memory times=new uint256[](_limit);
                 uint256[] memory number=new uint256[](_limit);
                 if(urecord[_owner].length>=1){
                     uint256 ci=0;
                     for(uint256 i=urecord[_owner].length;i>0;i--){
                     num[ci]=urecord[_owner][i-1].num;
                     owers[ci]=urecord[_owner][i-1].owers;
                     times[ci]=urecord[_owner][i-1].time;
                     number[ci]=urecord[_owner][i-1].number;
                     ci++;
                     if(ci>=_limit){
                         break;
                     }
                 }  
                 }
                  return(num,owers,times,number);
              }
               function getInvestment() public view returns(uint256){
                   return investment;
               }
                function getAlreadyFund(address _owner) public view returns(uint256){
                    return alreadyFund[_owner];
                }
                 function getSuperiorMoney(address _owner) public view returns(uint256){
                     return superiorMoney[_owner];
                 }
                  function getSC(address _owner) public view returns(address,uint256){
                      return(superior[_owner],recommend[_owner]);
                  }
                   function toLasts() public view returns(address[] memory,uint256[] memory){
                      uint256 length=4;
                      if(toLast.length<4){
                          length=toLast.length;
                      }
                        address[] memory towers=new address[](length);
                        uint256[] memory tnums=new uint256[](length);
                        uint256 num=0;
                        uint256 lengths=toLast.length;
                        for(uint i=lengths;i>0;i--){
                           towers[num]=toLast[i-1].lowers;
                            tnums[num]=toLast[i-1].lnum;
                            num++;
                            if(num>3){
                                break;
                            }
                        }
                      return(towers,tnums);
                   }
                     function statistics(address _owner) public view returns(uint256,uint256,uint256,uint256,uint256){
                            uint256 num=0;
                            if(total[_owner]<pool[_owner]){
                            uint256 day=(block.timestamp.sub(numbers[_owner])).div(releaseTime);
                            num=pool[_owner].mul(4).div(1000).mul(day);
                            if(total[_owner].add(num)>pool[_owner]){
                         num=pool[_owner].sub(total[_owner]);
                      }
                 } 
                         uint256 totalEth=total[_owner].add(num);
                        uint256 Areunlocked=pyramid[_owner].div(2);
                        uint256 buyEth=buyTokenEth[_owner];
                        uint256 buyToken=buyEthToken[_owner];
                        uint256 alreadyFunds=alreadyFund[_owner];
                        return(totalEth,Areunlocked,buyEth,buyToken,alreadyFunds);
                     }
                      function getMyMoney(address _owner)  public view returns(uint256){
                            uint256 num=0;
                            if(total[_owner]<pool[_owner]){   
                      uint256 day=(block.timestamp.sub(numbers[_owner])).div(releaseTime);
                      num=pool[_owner].mul(4).div(1000).mul(day);
                      if(total[_owner].add(num)>pool[_owner]){ 
                         num=pool[_owner].sub(total[_owner]);
                      }
                 } 
                       uint256 nums=0;
                       if(myMoney[_owner]<num){
                           nums=0;
                       }else{
                           nums=myMoney[_owner].sub(num);
                       }
                          return nums;
                      }
 }