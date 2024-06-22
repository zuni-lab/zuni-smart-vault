// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.25 <0.9.0;

import { Test } from "forge-std/src/Test.sol";
import { Parser } from "../src/Parser.sol";

pragma solidity >=0.8.25;

/// @dev If this is your first time with Forge, read this tutorial in the Foundry Book:
/// https://book.getfoundry.sh/forge/writing-tests

contract ParserTest is Test {
    // Parser internal p;
    using Parser for string;

    /// @dev Basic test. Run it with `forge test -vvv` to see the console log.
    function testParseTypes() public pure {
        string memory input = "uint256 a,address b,bool c";
        string[] memory output = input.extractTypes();
        assertEq(output.length, 3);
        assertEq(output[0], "uint256");
        assertEq(output[1], "address");
        assertEq(output[2], "bool");
    }

    function testParseTypesWithEmptyString() public {
        string memory input = "";
        bytes memory encodedError = abi.encodeWithSignature("EmptyInput()");
        vm.expectRevert(encodedError);
        input.extractTypes();
    }
}
