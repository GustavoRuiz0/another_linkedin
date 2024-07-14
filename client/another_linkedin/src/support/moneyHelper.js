export function formatSalary(salary) {
  if (isNaN(salary)) {
    return 'Invalid salary';
  }

  salary = parseFloat(salary);

  let formattedSalary = (salary / 1000).toFixed(1) + 'K';
  formattedSalary = formattedSalary.replace('.0K', 'K');

  return formattedSalary;
}