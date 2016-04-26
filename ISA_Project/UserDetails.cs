using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ISA_Project
{
    public class UserDetails
    {
        string firstName;
        string phoneNum;
        string carrier;

        public string getfirstName()
        {
            return firstName;
        }

        public string getphoneNum()
        {
            return phoneNum;
        }

        public string getcarrier()
        {
            return carrier;
        }

        public UserDetails(string firstName, string phoneNum, string carrier)
        {
            this.firstName = firstName;
            this.phoneNum = phoneNum;
            this.carrier = carrier;
        }
    }
}