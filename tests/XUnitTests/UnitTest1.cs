using System;
using FluentAssertions;
using Xunit;

namespace XUnitTests
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            //Arrange
            var one = 1;

            //Act
            var result = one == 1;

            //Assert
            result.Should().BeTrue();
        }
        
        [Fact]
        public void Test2()
        {
            //Arrange
            var one = 1;

            //Act
            var result = one == 1;

            //Assert
            result.Should().BeTrue();
        }

        [Fact]
        public void TestFail()
        {
            //Arrange
            var one = 1;

            //Act
            var result = one == 1;

            //Assert
            result.Should().BeFalse();
        }
    }
}