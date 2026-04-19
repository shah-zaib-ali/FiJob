using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Job_Portal_System.ViewModel
{
    public class ExternalJob
    {
        public string Title { get; set; }
        public string Company { get; set; }
        public string Location { get; set; }
        public string RedirectUrl { get; set; }
    }

    public class JobDataApiResponse
    {
        public List<JobDataApiResult> data { get; set; }
    }

    public class JobDataApiResult
    {
        public string title { get; set; }
        public string company { get; set; }
        public string location { get; set; }
        public string original_link { get; set; }
    }
}