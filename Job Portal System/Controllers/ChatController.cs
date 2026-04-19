using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Job_Portal_System.Controllers
{
    public class ChatController : Controller
    {
        private JobDBEntities3 db = new JobDBEntities3();
        public ActionResult Index(int receiverId)
        {
            if (Session["UserId"] == null) return RedirectToAction("Login", "Account");

            int senderId = (int)Session["UserId"];

            // Verify if user is job seeker and trying to message employer they haven't applied to
            var role = (string)Session["UserRole"]; // FIXED: It was Session["Role"] before. Correct is UserRole based on AccountController
            if (role == "JobSeeker")
            {
                var employer = db.EMPLOYERS.FirstOrDefault(e => e.employer_id == receiverId);
                if (employer != null)
                {
                    bool hasApplied = db.APPLICATIONS.Any(a => a.seeker_id == senderId && a.JOB.employer_id == receiverId);
                    if (!hasApplied)
                    {
                        TempData["Error"] = "You can only message employers you have applied to.";
                        return RedirectToAction("Dashboard", "JobSeeker");
                    }
                }
            }

            // History load karna taake purani baatein nazar aayein
            var history = db.Messages
                .Where(m => (m.SenderID == senderId && m.ReceiverID == receiverId) ||
                            (m.SenderID == receiverId && m.ReceiverID == senderId))
                .OrderBy(m => m.Timestamp)
                .ToList();

            // View ko batana ke dusra banda kaun hai
            var receiver = db.USERS.Find(receiverId);
            ViewBag.ReceiverName = receiver.full_name;
            ViewBag.ReceiverID = receiverId;

            // Make the layout dynamic based on who is logged in!
            if (role == "JobSeeker")
            {
                ViewBag.Layout = "~/Views/Shared/_JobSeekerDashboard.cshtml";
            }
            else if (role == "Employer")
            {
                ViewBag.Layout = "~/Views/Shared/_EmployeerDashboard.cshtml";
            }
            else 
            {
                ViewBag.Layout = "~/Views/Shared/_Layout.cshtml"; // fail safe
            }

            return View(history);
        }

        public ActionResult Inbox()
        {
            if (Session["UserId"] == null) return RedirectToAction("Login", "Account");
            int currentUserId = (int)Session["UserId"];
            var role = (string)Session["UserRole"]; // FIXED mapping here too

            // Un logon ki IDs nikalna jinse baat hui hai
            var userIds = db.Messages
                .Where(m => m.SenderID == currentUserId || m.ReceiverID == currentUserId)
                .Select(m => m.SenderID == currentUserId ? m.ReceiverID : m.SenderID)
                .Distinct()
                .ToList();

            // Un users ki details (names) nikalna
            var conversations = db.USERS
                .Where(u => userIds.Contains(u.UserId))
                .ToList();
            
            // If user is a JobSeeker, also show employers they have applied to (to easily start new chats)
            if (role == "JobSeeker")
            {
                var appliedEmployerIds = db.APPLICATIONS
                    .Where(a => a.seeker_id == currentUserId)
                    .Select(a => a.JOB.employer_id)
                    .Distinct()
                    .ToList();

                var appliedEmployers = db.USERS
                    .Where(u => appliedEmployerIds.Contains(u.UserId) && !userIds.Contains(u.UserId))
                    .ToList();
                
                conversations.AddRange(appliedEmployers);
                ViewBag.Layout = "~/Views/Shared/_JobSeekerDashboard.cshtml";
            }
            else if (role == "Employer")
            {
                ViewBag.Layout = "~/Views/Shared/_EmployeerDashboard.cshtml";
            }
            else 
            {
                ViewBag.Layout = "~/Views/Shared/_Layout.cshtml"; // fail safe
            }

            return View(conversations);
        }

    }
}