using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace project
{
    public class recipe
    {
        public int ID { get; set; }
        public string title { get; set; }
        public string  userName{ get; set; }
        public string  description { get; set; }
        public int likes { get; set; }
        public string  imgUrl { get; set; }
    }
}