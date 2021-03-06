package ar.edu.unicen.exa.galvarez.patogis.servidor.modelo;

import java.util.ArrayList;
import java.util.List;

public class ObservacionEspecieExample {
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	protected String orderByClause;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	protected boolean distinct;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to
	 * the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	protected List<Criteria> oredCriteria;

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public ObservacionEspecieExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void setDistinct(boolean distinct) {
		this.distinct = distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public boolean isDistinct() {
		return distinct;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public List<Criteria> getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public Criteria or() {
		Criteria criteria = createCriteriaInternal();
		oredCriteria.add(criteria);
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public void clear() {
		oredCriteria.clear();
		orderByClause = null;
		distinct = false;
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to
	 * the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	protected abstract static class GeneratedCriteria {
		protected List<Criterion> criteria;

		protected GeneratedCriteria() {
			super();
			criteria = new ArrayList<Criterion>();
		}

		public boolean isValid() {
			return criteria.size() > 0;
		}

		public List<Criterion> getAllCriteria() {
			return criteria;
		}

		public List<Criterion> getCriteria() {
			return criteria;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteria.add(new Criterion(condition));
		}

		protected void addCriterion(String condition, Object value,
				String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property
						+ " cannot be null");
			}
			criteria.add(new Criterion(condition, value));
		}

		protected void addCriterion(String condition, Object value1,
				Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property
						+ " cannot be null");
			}
			criteria.add(new Criterion(condition, value1, value2));
		}

		public Criteria andIdIsNull() {
			addCriterion("id is null");
			return (Criteria) this;
		}

		public Criteria andIdIsNotNull() {
			addCriterion("id is not null");
			return (Criteria) this;
		}

		public Criteria andIdEqualTo(Integer value) {
			addCriterion("id =", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotEqualTo(Integer value) {
			addCriterion("id <>", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThan(Integer value) {
			addCriterion("id >", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("id >=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThan(Integer value) {
			addCriterion("id <", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdLessThanOrEqualTo(Integer value) {
			addCriterion("id <=", value, "id");
			return (Criteria) this;
		}

		public Criteria andIdIn(List<Integer> values) {
			addCriterion("id in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotIn(List<Integer> values) {
			addCriterion("id not in", values, "id");
			return (Criteria) this;
		}

		public Criteria andIdBetween(Integer value1, Integer value2) {
			addCriterion("id between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andIdNotBetween(Integer value1, Integer value2) {
			addCriterion("id not between", value1, value2, "id");
			return (Criteria) this;
		}

		public Criteria andCantidadIsNull() {
			addCriterion("cantidad is null");
			return (Criteria) this;
		}

		public Criteria andCantidadIsNotNull() {
			addCriterion("cantidad is not null");
			return (Criteria) this;
		}

		public Criteria andCantidadEqualTo(Integer value) {
			addCriterion("cantidad =", value, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadNotEqualTo(Integer value) {
			addCriterion("cantidad <>", value, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadGreaterThan(Integer value) {
			addCriterion("cantidad >", value, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadGreaterThanOrEqualTo(Integer value) {
			addCriterion("cantidad >=", value, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadLessThan(Integer value) {
			addCriterion("cantidad <", value, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadLessThanOrEqualTo(Integer value) {
			addCriterion("cantidad <=", value, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadIn(List<Integer> values) {
			addCriterion("cantidad in", values, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadNotIn(List<Integer> values) {
			addCriterion("cantidad not in", values, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadBetween(Integer value1, Integer value2) {
			addCriterion("cantidad between", value1, value2, "cantidad");
			return (Criteria) this;
		}

		public Criteria andCantidadNotBetween(Integer value1, Integer value2) {
			addCriterion("cantidad not between", value1, value2, "cantidad");
			return (Criteria) this;
		}

		public Criteria andDistanciaIsNull() {
			addCriterion("distancia is null");
			return (Criteria) this;
		}

		public Criteria andDistanciaIsNotNull() {
			addCriterion("distancia is not null");
			return (Criteria) this;
		}

		public Criteria andDistanciaEqualTo(String value) {
			addCriterion("distancia =", value, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaNotEqualTo(String value) {
			addCriterion("distancia <>", value, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaGreaterThan(String value) {
			addCriterion("distancia >", value, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaGreaterThanOrEqualTo(String value) {
			addCriterion("distancia >=", value, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaLessThan(String value) {
			addCriterion("distancia <", value, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaLessThanOrEqualTo(String value) {
			addCriterion("distancia <=", value, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaLike(String value) {
			addCriterion("distancia like", value, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaNotLike(String value) {
			addCriterion("distancia not like", value, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaIn(List<String> values) {
			addCriterion("distancia in", values, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaNotIn(List<String> values) {
			addCriterion("distancia not in", values, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaBetween(String value1, String value2) {
			addCriterion("distancia between", value1, value2, "distancia");
			return (Criteria) this;
		}

		public Criteria andDistanciaNotBetween(String value1, String value2) {
			addCriterion("distancia not between", value1, value2, "distancia");
			return (Criteria) this;
		}

		public Criteria andConteoIsNull() {
			addCriterion("conteo is null");
			return (Criteria) this;
		}

		public Criteria andConteoIsNotNull() {
			addCriterion("conteo is not null");
			return (Criteria) this;
		}

		public Criteria andConteoEqualTo(String value) {
			addCriterion("conteo =", value, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoNotEqualTo(String value) {
			addCriterion("conteo <>", value, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoGreaterThan(String value) {
			addCriterion("conteo >", value, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoGreaterThanOrEqualTo(String value) {
			addCriterion("conteo >=", value, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoLessThan(String value) {
			addCriterion("conteo <", value, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoLessThanOrEqualTo(String value) {
			addCriterion("conteo <=", value, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoLike(String value) {
			addCriterion("conteo like", value, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoNotLike(String value) {
			addCriterion("conteo not like", value, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoIn(List<String> values) {
			addCriterion("conteo in", values, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoNotIn(List<String> values) {
			addCriterion("conteo not in", values, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoBetween(String value1, String value2) {
			addCriterion("conteo between", value1, value2, "conteo");
			return (Criteria) this;
		}

		public Criteria andConteoNotBetween(String value1, String value2) {
			addCriterion("conteo not between", value1, value2, "conteo");
			return (Criteria) this;
		}

		public Criteria andEdadIsNull() {
			addCriterion("edad is null");
			return (Criteria) this;
		}

		public Criteria andEdadIsNotNull() {
			addCriterion("edad is not null");
			return (Criteria) this;
		}

		public Criteria andEdadEqualTo(String value) {
			addCriterion("edad =", value, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadNotEqualTo(String value) {
			addCriterion("edad <>", value, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadGreaterThan(String value) {
			addCriterion("edad >", value, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadGreaterThanOrEqualTo(String value) {
			addCriterion("edad >=", value, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadLessThan(String value) {
			addCriterion("edad <", value, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadLessThanOrEqualTo(String value) {
			addCriterion("edad <=", value, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadLike(String value) {
			addCriterion("edad like", value, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadNotLike(String value) {
			addCriterion("edad not like", value, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadIn(List<String> values) {
			addCriterion("edad in", values, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadNotIn(List<String> values) {
			addCriterion("edad not in", values, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadBetween(String value1, String value2) {
			addCriterion("edad between", value1, value2, "edad");
			return (Criteria) this;
		}

		public Criteria andEdadNotBetween(String value1, String value2) {
			addCriterion("edad not between", value1, value2, "edad");
			return (Criteria) this;
		}

		public Criteria andObservacionesIsNull() {
			addCriterion("observaciones is null");
			return (Criteria) this;
		}

		public Criteria andObservacionesIsNotNull() {
			addCriterion("observaciones is not null");
			return (Criteria) this;
		}

		public Criteria andObservacionesEqualTo(String value) {
			addCriterion("observaciones =", value, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesNotEqualTo(String value) {
			addCriterion("observaciones <>", value, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesGreaterThan(String value) {
			addCriterion("observaciones >", value, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesGreaterThanOrEqualTo(String value) {
			addCriterion("observaciones >=", value, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesLessThan(String value) {
			addCriterion("observaciones <", value, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesLessThanOrEqualTo(String value) {
			addCriterion("observaciones <=", value, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesLike(String value) {
			addCriterion("observaciones like", value, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesNotLike(String value) {
			addCriterion("observaciones not like", value, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesIn(List<String> values) {
			addCriterion("observaciones in", values, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesNotIn(List<String> values) {
			addCriterion("observaciones not in", values, "observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesBetween(String value1, String value2) {
			addCriterion("observaciones between", value1, value2,
					"observaciones");
			return (Criteria) this;
		}

		public Criteria andObservacionesNotBetween(String value1, String value2) {
			addCriterion("observaciones not between", value1, value2,
					"observaciones");
			return (Criteria) this;
		}

		public Criteria andIdObservacionIsNull() {
			addCriterion("id_observacion is null");
			return (Criteria) this;
		}

		public Criteria andIdObservacionIsNotNull() {
			addCriterion("id_observacion is not null");
			return (Criteria) this;
		}

		public Criteria andIdObservacionEqualTo(Integer value) {
			addCriterion("id_observacion =", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionNotEqualTo(Integer value) {
			addCriterion("id_observacion <>", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionGreaterThan(Integer value) {
			addCriterion("id_observacion >", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionGreaterThanOrEqualTo(Integer value) {
			addCriterion("id_observacion >=", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionLessThan(Integer value) {
			addCriterion("id_observacion <", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionLessThanOrEqualTo(Integer value) {
			addCriterion("id_observacion <=", value, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionIn(List<Integer> values) {
			addCriterion("id_observacion in", values, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionNotIn(List<Integer> values) {
			addCriterion("id_observacion not in", values, "idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionBetween(Integer value1, Integer value2) {
			addCriterion("id_observacion between", value1, value2,
					"idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdObservacionNotBetween(Integer value1,
				Integer value2) {
			addCriterion("id_observacion not between", value1, value2,
					"idObservacion");
			return (Criteria) this;
		}

		public Criteria andIdEspecieIsNull() {
			addCriterion("id_especie is null");
			return (Criteria) this;
		}

		public Criteria andIdEspecieIsNotNull() {
			addCriterion("id_especie is not null");
			return (Criteria) this;
		}

		public Criteria andIdEspecieEqualTo(Integer value) {
			addCriterion("id_especie =", value, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieNotEqualTo(Integer value) {
			addCriterion("id_especie <>", value, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieGreaterThan(Integer value) {
			addCriterion("id_especie >", value, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieGreaterThanOrEqualTo(Integer value) {
			addCriterion("id_especie >=", value, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieLessThan(Integer value) {
			addCriterion("id_especie <", value, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieLessThanOrEqualTo(Integer value) {
			addCriterion("id_especie <=", value, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieIn(List<Integer> values) {
			addCriterion("id_especie in", values, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieNotIn(List<Integer> values) {
			addCriterion("id_especie not in", values, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieBetween(Integer value1, Integer value2) {
			addCriterion("id_especie between", value1, value2, "idEspecie");
			return (Criteria) this;
		}

		public Criteria andIdEspecieNotBetween(Integer value1, Integer value2) {
			addCriterion("id_especie not between", value1, value2, "idEspecie");
			return (Criteria) this;
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to
	 * the database table public.observacion_especie
	 * 
	 * @mbggenerated Sun Jun 12 16:42:33 ART 2011
	 */
	public static class Criterion {
		private String condition;
		private Object value;
		private Object secondValue;
		private boolean noValue;
		private boolean singleValue;
		private boolean betweenValue;
		private boolean listValue;
		private String typeHandler;

		public String getCondition() {
			return condition;
		}

		public Object getValue() {
			return value;
		}

		public Object getSecondValue() {
			return secondValue;
		}

		public boolean isNoValue() {
			return noValue;
		}

		public boolean isSingleValue() {
			return singleValue;
		}

		public boolean isBetweenValue() {
			return betweenValue;
		}

		public boolean isListValue() {
			return listValue;
		}

		public String getTypeHandler() {
			return typeHandler;
		}

		protected Criterion(String condition) {
			super();
			this.condition = condition;
			this.typeHandler = null;
			this.noValue = true;
		}

		protected Criterion(String condition, Object value, String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.typeHandler = typeHandler;
			if (value instanceof List<?>) {
				this.listValue = true;
			} else {
				this.singleValue = true;
			}
		}

		protected Criterion(String condition, Object value) {
			this(condition, value, null);
		}

		protected Criterion(String condition, Object value, Object secondValue,
				String typeHandler) {
			super();
			this.condition = condition;
			this.value = value;
			this.secondValue = secondValue;
			this.typeHandler = typeHandler;
			this.betweenValue = true;
		}

		protected Criterion(String condition, Object value, Object secondValue) {
			this(condition, value, secondValue, null);
		}
	}

	/**
	 * This class was generated by MyBatis Generator. This class corresponds to
	 * the database table observacion_especie
	 * 
	 * @mbggenerated do_not_delete_during_merge Sat Jun 04 08:05:19 ART 2011
	 */
	public static class Criteria extends GeneratedCriteria {

		protected Criteria() {
			super();
		}
	}
}