using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace projectLastVer
{
    public class recipeToEdit
    {
        public string title { get; set; }
        public string description { get; set; }
        public string instruction { get; set; }
        public int categoryId { get; set; }
        public string ingredients { get; set; }
    }
}