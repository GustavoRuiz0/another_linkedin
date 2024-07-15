import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
import { useEffect } from 'react';

const AddJobPage = ({ addJobSubmit }) => {
  const [title, setTitle] = useState('');
  const [job_type, setJobType] = useState('Full-Time');
  const [location, setLocation] = useState('');
  const [description, setDescription] = useState('');
  const [salary, setSalary] = useState('');
  const [company_id, setCompanyId] = useState('');
  const [companyOptions, setCompanyOptions] = useState([])

  const navigate = useNavigate();

  useEffect(() => {
    const fetchCompanyOptions = async () => {
      const apiUrl = '/api/companies/companies_options'
      try {
        const res = await fetch(apiUrl);
        const data = await res.json();
        setCompanyOptions(data);
        console.log(companyOptions)
      } catch (e) {
        console.log('Error fetching data', e)
      }
    }
    fetchCompanyOptions();
  }, [])

  const submitForm = (e) => {
    e.preventDefault();

    const newJob = {
      title,
      job_type,
      location,
      description,
      salary,
      company_id,
    };

    addJobSubmit(newJob);

    toast.success('Job Added Successfully');

    return navigate('/jobs');
  };

  return (
    <section className='bg-indigo-50'>
      <div className='container m-auto max-w-2xl py-24'>
        <div className='bg-white px-6 py-8 mb-4 shadow-md rounded-md border m-4 md:m-0'>
          <form onSubmit={submitForm}>
            <h2 className='text-3xl text-center font-semibold mb-6'>Add Job</h2>

            <div className='mb-4'>
              <label
                htmlFor='type'
                className='block text-gray-700 font-bold mb-2'
              >
                Job Type
              </label>
              <select
                id='type'
                name='type'
                className='border rounded w-full py-2 px-3'
                required
                value={job_type}
                onChange={(e) => setJobType(e.target.value)}
              >
                <option value='Full-Time'>Full-Time</option>
                <option value='Part-Time'>Part-Time</option>
                <option value='Remote'>Remote</option>
                <option value='Internship'>Internship</option>
              </select>
            </div>

            <div className='mb-4'>
              <label className='block text-gray-700 font-bold mb-2'>
                Job Listing Name
              </label>
              <input
                type='text'
                id='title'
                name='title'
                className='border rounded w-full py-2 px-3 mb-2'
                placeholder='eg. Beautiful Apartment In Miami'
                min={3}
                max={60}
                required
                value={title}
                onChange={(e) => setTitle(e.target.value)}
              />
            </div>
            <div className='mb-4'>
              <label
                htmlFor='description'
                className='block text-gray-700 font-bold mb-2'
              >
                Description
              </label>
              <textarea
                id='description'
                name='description'
                className='border rounded w-full py-2 px-3'
                rows='4'
                min={30}
                max={500}
                placeholder='Add any job duties, expectations, requirements, etc'
                value={description}
                onChange={(e) => setDescription(e.target.value)}
              ></textarea>
            </div>

            <div className='mb-4'>
              <label
                htmlFor='type'
                className='block text-gray-700 font-bold mb-2'
              >
                Salary
              </label>
              <input
                type='text'
                id='salary'
                name='salary'
                className='border rounded w-full py-2 px-3 mb-2'
                placeholder='$5000'
                required
                value={salary}
                onChange={(e) => setSalary(e.target.value)}
              />
            </div>

            <div className='mb-4'>
              <label className='block text-gray-700 font-bold mb-2'>
                Location
              </label>
              <input
                type='text'
                id='location'
                name='location'
                className='border rounded w-full py-2 px-3 mb-2'
                placeholder='Company Location'
                required
                max={50}
                value={location}
                onChange={(e) => setLocation(e.target.value)}
              />
            </div>

            <h3 className='text-2xl mb-5'>Company Info</h3>

            <div className='mb-4'>
              <label
                htmlFor='company_description'
                className='block text-gray-700 font-bold mb-2'
              >
                Company Description
              </label>
              <select
                id='company_id'
                name='company_id'
                className='border rounded w-full py-2 px-3'
                required
                value={company_id}
                onChange={(e) => setCompanyId(e.target.value)}
              >
                {companyOptions.map((company) => (
                  <>
                    <option value={company.id}>{company.name}</option>
                  </>
                ))}
              </select>
            </div>
            <div>
              <button
                className='bg-indigo-500 hover:bg-indigo-600 text-white font-bold py-2 px-4 rounded-full w-full focus:outline-none focus:shadow-outline'
                type='submit'
              >
                Add Job
              </button>
            </div>
          </form>
        </div>
      </div>
    </section>
  );
};
export default AddJobPage;