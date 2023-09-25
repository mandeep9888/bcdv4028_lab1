// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

library ArrayOperations {
    
     function sortArray(uint[] memory array) public pure returns (uint[] memory ){
        bool swapped;
        for (uint i = 1; i < array.length; i++) {
            swapped = false;
            for (uint j = 0; j < array.length - i; j++) {
                uint next = array[j + 1];
                uint actual = array[j];
                if (next < actual) {
                    array[j] = next;
                    array[j + 1] = actual;
                    swapped = true;
                }
            }
            if (!swapped) {
                return array;
            }
        }

        return array;
     }



        function removeDuplicates(uint[] memory arr) public pure returns (uint[] memory) {
        if (arr.length <= 1) {
            return arr;
        }

        uint[] memory uniqueArr = new uint[](arr.length);
        uint uniqueCount = 0;
        bool exists;

        for (uint i = 0; i < arr.length; i++) {
            exists = false;
            for (uint j = 0; j < uniqueCount; j++) {
                if (arr[i] == uniqueArr[j]) {
                    exists = true;
                    break;
                }
            }
            if (!exists) {
                uniqueArr[uniqueCount] = arr[i];
                uniqueCount++;
            }
        }
        uint[] memory result = new uint[](uniqueCount);
        for (uint i = 0; i < uniqueCount; i++) {
            result[i] = uniqueArr[i];
        }
        return result;
    }
    
}

 contract ArrayOp {
        using ArrayOperations for uint[]; // Use the ArrayOperations library for uint[] arrays


        uint[] private originalArray;
        uint[] private uniqueArray;
        uint[] private sortedArray;

         constructor(uint[] memory _originalArray) {
        originalArray = _originalArray;
        sortedArray = _originalArray.sortArray();
        uniqueArray = _originalArray.removeDuplicates();
    }       

        function getUniqueArr() public view returns(uint[] memory) {
            return uniqueArray;
        }

          function getSorted() public view returns(uint[] memory) {
            return sortedArray;
        }
       
 }