import { RouterProvider, createBrowserRouter, Route } from 'react-router-dom';
import { useAuth } from '../provider/authProvider';
import ProtectedRoute from './ProtectedRoute'; // Use default import
import MainLayout from '../layouts/MainLayout';
import HomePage from '../pages/HomePage';
import JobsPage from '../pages/JobsPage';
import NotFoundPage from '../pages/NotFoundPage';
import JobPage, { jobLoader } from '../pages/JobPage';
import AddJobPage from '../pages/AddJobPage';
import EditJobPage from '../pages/EditJobPage';
import JobsListing from '../components/JobsListing';
import { redirect } from 'react-router-dom';
import LoginPage from '../pages/LoginPage';
import { Navigate } from 'react-router-dom';
import { toast } from 'react-toastify';


const addJob = async (newJob) => {
  const res = await fetch('/api/jobs', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(newJob),
  });
  return;
};

const deleteJob = async (id) => {
  const res = await fetch(`/api/jobs/${id}`, {
    method: 'DELETE',
  });
  return;
};

const updateJob = async (job) => {
  const res = await fetch(`/api/jobs/${job.id}`, {
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(job),
  });
  return;
};

const Routes = () => {
  const { token } = useAuth();

  const routesForPublic = [
    {
      path: '/',
      element: <MainLayout />,
      children: [
        { path: '/', element: <HomePage /> },
        { path: '/jobs', element: <JobsPage /> },
        { path: 'login', element: <LoginPage /> },

      ],
    },
  ];

  const routesForAuthenticatedOnly = [
    {
      path: '/',
      element: <ProtectedRoute />,
      children: [
        { path: '/add-job', element: <AddJobPage/>  },
      ],
    },
  ];

  const routesForNotAuthenticatedOnly = [
    { path: '/', element: <div>Home Page</div> },
    { path: 'login', element: <LoginPage/> },
  ];

  const router = createBrowserRouter([
    ...routesForPublic,
    ...(!token ? routesForNotAuthenticatedOnly : []),
    ...routesForAuthenticatedOnly,
  ]);

  return <RouterProvider router={router} />;
};

export default Routes;
