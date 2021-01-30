pragma solidity ^0.6.0;

import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router01.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IERC20.sol";

contract SwapTokenForEth {
  IUniswapV2Router01 uniswapV2;

  constructor(address _uniswapV2) public {
    uniswapV2 = IUniswapV2Router01(_uniswapv2);
  }

  function swapTokensForETH(
      address token,
      uint amountIn,
      uint amountOutMin,
      uint deadline)
      external {
        IERC20(token).transferFrom(msg.sender, address(this), amountIn);
        address[] memory path = new address[](2);
        path[0] = token;
        path[1] = uniswapV2.WETH();
        IERC20.approve(address(uniswapV2), amountIn);
        uniswapV2.swapExactTokensForETH(
        amountIn,
        amountOutMin,
        path,
        msg.sender,
        deadline
      );
  }
}
