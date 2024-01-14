//SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;

import "./lib/Tick.sol";
import "./lib/Position.sol";

contract UniswapV3Pool{
    using Tick for mapping(int24=> Tick.Info);
    using Position for mapping(bytes32 => Position.Info);
    using Position for Position.Info;


    int24 internal constant MIN_TICK=-887272;
    int24 internal constant MAX_TICK=-MIN_TICK;


    address public immutable token0;
    address public immutable token1;

    //packing variables that read toget

    struct Slot0{
        uint160 sqrtPriceX;
        int24 currentTick;
    } 

    Slot0 public slot0;

    uint256 public liquidity;

    mapping(int24=> Tick.Info) public ticks;
    mapping(bytes32 => Position.Info) positions;

    constructor(address _token0,address _token1,uint160 _sqrtPriceX,int24 _tick){
        token0=_token0;
        token1=_token1;
        slot0=Slot0({sqrtPriceX:_sqrtPriceX,currentTick:_tick});
    }

}